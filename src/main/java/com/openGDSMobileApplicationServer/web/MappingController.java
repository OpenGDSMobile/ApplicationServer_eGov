package com.openGDSMobileApplicationServer.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MappingController {
	
	@RequestMapping(value="/integratedDemo.do")
	public String webMappingDemo(){ 
		return "webmapping/integratedDemo";
	}
	
    @RequestMapping(value="/ODM_Dashboard.do")
    String index() {
        return "webmapping/collected/index";
    }

    @RequestMapping(value="/ODM_Management.do")
    String management() {return "webmapping/collected/management"; }

    @RequestMapping(value="/ODM_Original.do")
    String original() {return "webmapping/collected/vis/original"; }

    @RequestMapping(value="/ODM_Chart.do")
    String chart() {return "webmapping/collected/vis/chart"; }

    @RequestMapping(value="/ODM_Map.do")
    String map() {return "webmapping/collected/vis/map"; }


	/*
	@Autowired
	@Qualifier("realtimeTable")
	TableService ts;
	
	@RequestMapping(headers="Content-Type=application/json", value="/realtimeInfoSearch.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> realtimeSearchTable(@RequestBody String str){
		Map<String, Object> message = new HashMap<String, Object>();
		JSONObject JSONData = new JSONObject(str);
		try {
			message.put("result", "OK");
			message.put("message", null);
			if (JSONData.get("column").equals("userid")) {
				boolean resultData;
				if (ts.searchTable(JSONData) == null ){
					resultData = true;
				} else {
					resultData = false;
				}
				message.put("data", resultData);
			} else {
				message.put("data", ts.searchTable(JSONData));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return message;
	}
	
	@RequestMapping(headers="Content-Type=application/json", value="/realtimeInfoInsert.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> realtimeInsertTable(@RequestBody String str){
		Map<String, Object> message = new HashMap<String, Object>();
		JSONObject JSONData = new JSONObject(str);
		try {
			message.put("result", "OK");
			message.put("message", null); 
			message.put("data", ts.insertData(JSONData));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return message;
	}
	
	@RequestMapping(headers="Content-Type=application/json", value="/realtimeInfoDelete.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> realtimeDeleteTable(@RequestBody String str){
		Map<String, Object> message = new HashMap<String, Object>();
		JSONObject JSONData = new JSONObject(str);
		try {
			message.put("result", "OK");
			message.put("message", null); 
			message.put("data", ts.deleteData(JSONData));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return message;
		
	}
*/
	
}
