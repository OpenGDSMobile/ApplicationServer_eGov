package com.openGDSMobileApplicationServer.core.dao;

import java.io.IOException;
import java.net.URISyntaxException;

import org.jdom2.Document;
import org.jdom2.JDOMException;
import org.json.JSONObject;
 

public interface OpenData {

	JSONObject getJSON(String path, String encoding) throws URISyntaxException, IOException;
	Document getXML(String path) throws JDOMException, IOException;
}
