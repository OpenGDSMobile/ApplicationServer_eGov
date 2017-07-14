package com.openGDSMobileApplicationServer;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.mongodb.MongoClient;

@Configuration
public class MongoDBConfiguration {
	
	@Bean
	MongoTemplate mongoTemplate(){
        MongoTemplate mongoTemplate = null;
        try {
            mongoTemplate = new MongoTemplate(new MongoClient("127.0.0.1"), "opengdsmobiledata");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return mongoTemplate;
	}

}
