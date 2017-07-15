package com.openGDSMobileApplicationServer.service.impl;
 

import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;

import org.jdom2.Document;
import org.jdom2.input.SAXBuilder;
import org.json.JSONObject;
import org.springframework.stereotype.Repository; 

import com.openGDSMobileApplicationServer.service.PublicData;
 


@Repository("PortalDAO") 
public class PublicDataPortalDAO  implements PublicData{
 

	PublicDataPortalDAO(){
		
	}
	
	@Override
	public JSONObject getJSONPublicData(String path) {
		
		return null;
	}
	
	@Override
	public Document getXMLPublicData(String path) {
		try {
			URL url = new URL(path);
			SAXBuilder builder = new SAXBuilder();
			Document doc = builder.build(url);
			return doc;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public JSONObject getOpenDataJSON(String path, String encoding) throws URISyntaxException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
