package com.openGDSMobileApplicationServer.quartz;
 

/**
 * Created by intruder on 16. 8. 11.
 */
public interface SchedulerManagement {

    void registerSchedule(String key, int time);
    void resumeSchedule(String key);
    void stopSchedule(String key);
    void searchSchedule();
    void deleteSchedule(String key);
    void editTimeSchedule(String key,int time);

}
