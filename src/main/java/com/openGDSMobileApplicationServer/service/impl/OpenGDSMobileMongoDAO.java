package com.openGDSMobileApplicationServer.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.CommandResult;
import com.mongodb.DBObject;

@Repository
public class OpenGDSMobileMongoDAO {

    @Autowired
    MongoOperations mongoOperations;
    

    public Boolean createCollection(String name){
        if (!mongoOperations.getCollectionNames().contains(name)){
            mongoOperations.createCollection(name);
            return true;
        }
        return false;
    }
    public Boolean createCollection(String name, String indexes){
        if (!mongoOperations.getCollectionNames().contains(name)){
            mongoOperations.createCollection(name);
            mongoOperations.getCollection(name).createIndex(indexes);
            return true;
        }
        return false;
    }
    public Boolean dropCollection(String name){
        if (mongoOperations.getCollectionNames().contains(name)){
            mongoOperations.dropCollection(name);
            return true;
        }
        return false;
    }
    public Boolean insertData(String name, Object obj){
        mongoOperations.insert(obj, name);
        return true;
    }

    public Boolean chkCollection(String name){
        if (!mongoOperations.getCollectionNames().contains(name)){
            return false;
        }
        return true;
    }
    public List<Object> findAll(String name) {
        return mongoOperations.findAll(Object.class, name);
    }


        //BasicQuery query = new BasicQuery("{}, {_id:0, " + q + ":1}");
    public List<Object> findFieldQuery(String name, String q){
        Query query = new Query();
        query.fields().include(q);
        return mongoOperations.find(query, Object.class, name);
    }


    public Object findFirstQuery(String name){
        Query query = new Query();
        return mongoOperations.findOne(query, Object.class, name);
    }

    public List<Object> findWhereQuery(String name, String queryType, String field, String q, String[] sFields){
        Query query = new Query();
        if (sFields !=null){
            for (String value : sFields){
                query.fields().include(value);
            }
        }
        query = queryExec(query, queryType, field, q);
        return mongoOperations.find(query, Object.class, name);
    }

    public List<Object> findWhereMultiQuery(String name, List<DBObject> query){
    System.out.println(query.toString());
        AggregationOutput aggr= mongoOperations.getCollection(name).aggregate(query);
        Iterable<DBObject> iter = aggr.results();
        List<Object> result = new ArrayList<Object>();
        DBObject root = new BasicDBObject();

        for (DBObject obj : iter){
           result.add(obj);

        }
        return result;
    }

    public Object findValueSearchQuery(String name, String key){
        CommandResult result = mongoOperations.executeCommand("{distinct: \"" + name + "\", key: \"" + key + "\"}");
        return result.get("values");
    }

    public Query queryExec(Query query, String queryType, String field, String q){
        if (queryType.equals("=")){
            query.addCriteria(Criteria.where(field).is(q));
        } else if (queryType.equals(">=") || queryType.equals("&gt;=")){
            query.addCriteria(Criteria.where(field).gte(q));
        } else if (queryType.equals(">") || queryType.equals("&gt;")){
            query.addCriteria(Criteria.where(field).gt(q));
        } else if (queryType.equals("<") || queryType.equals("&lt;")){
            query.addCriteria(Criteria.where(field).lt(q));
        } else if (queryType.equals("<=") || queryType.equals("&lt;=")){
            query.addCriteria(Criteria.where(field).lte(q));
        }
        return query;
    }

    
}
