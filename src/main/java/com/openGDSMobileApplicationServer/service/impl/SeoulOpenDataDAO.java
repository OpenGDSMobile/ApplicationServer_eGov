package com.openGDSMobileApplicationServer.service.impl;
 

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;

import org.jdom2.Document;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.stereotype.Repository; 

import com.openGDSMobileApplicationServer.service.PublicData;



@Repository("seoulPublicDAO") 
public class SeoulOpenDataDAO implements PublicData {

	 
	
	SeoulOpenDataDAO(){
	}
	
	@Override
	public JSONObject getJSONPublicData(String path) {
		URI url = null;
		try {
			url = new URI(path);
			JSONTokener tokener = new JSONTokener(url.toURL().openStream());
			JSONObject jo = new JSONObject(tokener);
			return jo;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Document getXMLPublicData(String path) {
		// TODO Auto-generated method stub
		return null;
	}


    public JSONObject getOpenDataJSON(String path, String encoding) throws URISyntaxException, IOException {
        URI uri = new URI(path);
        InputStreamReader is = new InputStreamReader(uri.toURL().openStream(), encoding);
        JSONTokener tokener = new JSONTokener(is);
        JSONObject obj = new JSONObject(tokener);
        return obj;
    }
 
	
}
