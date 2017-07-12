package com.openGDSMobileApplicationServer.core.dao.impl;


import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import org.jdom2.Document;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.stereotype.Repository; 
import com.openGDSMobileApplicationServer.core.dao.OpenData; 
  
@Repository("seoulOpenDAO") 
public class SeoulOpenDataDAO implements OpenData {
	
	SeoulOpenDataDAO(){	}
	@Override
	public JSONObject getJSON(String path, String encoding) throws URISyntaxException, IOException {
		URI uri = new URI(path);
	    InputStreamReader is = new InputStreamReader(uri.toURL().openStream(), encoding);
        JSONTokener tokener = new JSONTokener(is);
        JSONObject obj = new JSONObject(tokener);
        return obj;
	}

	@Override
	public Document getXML(String path) throws JDOMException, IOException {
        URL url = new URL(path);
        SAXBuilder builder = new SAXBuilder();
        Document doc = builder.build(url);
        return doc;
	}

}
