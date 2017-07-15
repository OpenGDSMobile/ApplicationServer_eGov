package com.openGDSMobileApplicationServer.quartz;

import java.text.SimpleDateFormat;
import java.util.Calendar;
 
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Service;

import com.openGDSMobileApplicationServer.service.PublicDataService;

@Service
public class SeoulOpenDataJob extends QuartzJobBean{

	@Autowired
	@Qualifier("Seoul")
	PublicDataService seoulService;
	Logger log = LoggerFactory.getLogger(SeoulOpenDataJob.class);

	@Override
	protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        String dataName = jobExecutionContext.getJobDetail().getKey().getName();
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
        String resultTime = dateFormat.format(calendar.getTime());
        log.info(resultTime);
        seoulService.requestData(dataName);
	}
	

}
