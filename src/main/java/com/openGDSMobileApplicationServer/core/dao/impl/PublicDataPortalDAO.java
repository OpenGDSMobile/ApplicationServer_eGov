package com.openGDSMobileApplicationServer.core.dao.impl;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import org.jdom2.Document;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.stereotype.Repository;
import com.openGDSMobileApplicationServer.core.dao.OpenData;

@Repository("PortalDAO")
public class PublicDataPortalDAO implements OpenData {

	
	PublicDataPortalDAO() {}

	@Override
	public JSONObject getJSON(String path, String encoding) throws URISyntaxException, IOException {
		URI url = new URI(path);
		InputStreamReader is = new InputStreamReader(url.toURL().openStream(), encoding);//"EUC-KR" Encoding for Hangul breakage occurs.
		JSONTokener tokener = new JSONTokener(is);
		JSONArray ja = new JSONArray(tokener);//Return value is JSONArray.
		JSONObject jo = new JSONObject();
		jo.put("row", ja);
		return jo;
	}

	@Override
	public Document getXML(String path) throws JDOMException, IOException  {
		URL url = new URL(path);
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(url);
		return doc;
	}

}
