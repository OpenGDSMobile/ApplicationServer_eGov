package com.openGDSMobileApplicationServer.api;


import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Administrator on 2016-08-11.
 */
@RestController
@RequestMapping("/api/Scheduler")
public class SchedulerController {
    Logger log = LoggerFactory.getLogger(SchedulerController.class);

    @Autowired
    private SchedulerFactoryBean schedulerFactory;

    @RequestMapping(value="/SeoulOpenData", method = RequestMethod.POST)
    public ResponseEntity<String> registerStartScheduler(@RequestParam(value="name") String name){


        return null;
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<String> editScheduler(){
        return null;
    }


    @RequestMapping(method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteScheduler(){
        try {
            schedulerFactory.getScheduler().deleteJob(JobKey.jobKey("test"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<String> searchScheduler(){
        return null;
    }
}
