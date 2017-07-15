package com.openGDSMobileApplicationServer.quartz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Repository;
import org.quartz.*;

import static org.quartz.SimpleScheduleBuilder.simpleSchedule;

@Repository("SeoulScheduler")
public class SeoulSchedulerImp implements SchedulerManagement {
    @Autowired
    private SchedulerFactoryBean schedulerFactory;
    
	@Override
	public void registerSchedule(String key, int time) {

        JobKey jobKey = new JobKey(key);
        TriggerKey triggerKey = new TriggerKey(key);

        JobDetail job = JobBuilder.newJob(SeoulOpenDataJob.class)
                .withIdentity(jobKey).build();

        //0/10 * * * * ?
        Trigger trigger = TriggerBuilder.newTrigger()
                .withIdentity(triggerKey)
                .withSchedule(simpleSchedule().withIntervalInMinutes(time).repeatForever()).build();

        try {

            schedulerFactory.getScheduler().scheduleJob(job, trigger);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }	
	}

	@Override
	public void resumeSchedule(String key) {
        try {
            schedulerFactory.getScheduler().resumeJob(JobKey.jobKey(key));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }		
	}

	@Override
	public void stopSchedule(String key) {
        try {

            schedulerFactory.getScheduler().pauseJob(JobKey.jobKey(key));
            //log.info(ttt.getKey().getName());
            /*schedulerFactory.getScheduler().unscheduleJob(TriggerKey.triggerKey(key));*/


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
	}

	@Override
	public void searchSchedule() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSchedule(String key) {
        try {
            schedulerFactory.getScheduler().deleteJob(JobKey.jobKey(key));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
	}

	@Override
	public void editTimeSchedule(String key, int time) {
        try {
            Trigger oldTrigger = schedulerFactory.getScheduler().getTrigger(TriggerKey.triggerKey(key));
            TriggerBuilder tb = oldTrigger.getTriggerBuilder();

            Trigger newTrigger = tb.withSchedule(simpleSchedule().withIntervalInMinutes(time).repeatForever()).build();
            schedulerFactory.getScheduler().rescheduleJob(oldTrigger.getKey(), newTrigger);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

		
	}

}
