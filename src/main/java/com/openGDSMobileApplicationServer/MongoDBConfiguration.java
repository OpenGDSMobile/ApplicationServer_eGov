package com.openGDSMobileApplicationServer;

import java.net.UnknownHostException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.authentication.UserCredentials;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;
import org.springframework.data.mongodb.core.convert.DefaultDbRefResolver;
import org.springframework.data.mongodb.core.convert.DefaultMongoTypeMapper;
import org.springframework.data.mongodb.core.convert.MappingMongoConverter;
import org.springframework.data.mongodb.core.mapping.MongoMappingContext;

import com.mongodb.MongoClient;

@Configuration
public class MongoDBConfiguration {
	/*
	@Bean
	MongoTemplate mongoTemplate(){
        MongoTemplate mongoTemplate = null;
        try {
            mongoTemplate = 
            		new MongoTemplate(
            				new MongoClient("127.0.0.1"), 
            				"opengdsmobiledata");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return mongoTemplate;
	}
	*/

}
