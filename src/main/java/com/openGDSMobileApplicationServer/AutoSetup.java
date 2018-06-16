package com.openGDSMobileApplicationServer;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Component;

import static org.quartz.SimpleScheduleBuilder.*;
import com.openGDSMobileApplicationServer.quartz.SeoulOpenDataJob;
import com.openGDSMobileApplicationServer.service.impl.OpenGDSMobileTableDAO;
import com.openGDSMobileApplicationServer.valueObject.CollectVO;

@Component
public class AutoSetup implements ApplicationListener<ContextRefreshedEvent>{
	   @Autowired
	    private SchedulerFactoryBean schedulerFactory;

	    @Autowired
	    private OpenGDSMobileTableDAO dao;

	    Logger log = LogManager.getLogger("org.springframework");
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
        List<CollectVO> items = dao.findAllCollect();
        for (int i=0; i<items.size(); i++){
            String key = items.get(i).getName();
            int time = items.get(i).getTime();

            JobKey jobKey = new JobKey(key);
            TriggerKey triggerKey = new TriggerKey(key);

            JobDetail job = JobBuilder.newJob(SeoulOpenDataJob.class)
                    .withIdentity(jobKey).build();

            Trigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity(triggerKey)
                    .withSchedule(simpleSchedule().withIntervalInMinutes(time).repeatForever()).build();
                    /*.withSchedule(CronScheduleBuilder.cronSchedule(cron)).build();*/
            
            try {
                schedulerFactory.getScheduler().scheduleJob(job, trigger);
                if (items.get(i).isStatus() == false) {
                    schedulerFactory.getScheduler().pauseJob(jobKey);
                }

            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

}
