package com.openGDSMobileApplicationServer.service;
 
import java.io.IOException;
import java.net.URISyntaxException;

import org.jdom2.Document;
import org.json.JSONObject;

public interface PublicData {
	
	JSONObject getJSONPublicData(String path);
	Document getXMLPublicData(String path);
	JSONObject getOpenDataJSON(String path, String encoding) throws URISyntaxException, IOException;

}