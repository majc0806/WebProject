package org.j2ee.ssh;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

public class AgeAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Map<Integer, String> agemap;

	public Map<Integer, String> getAgemap() {
		return agemap;
	}

	public void setAgemap(Map<Integer, String> agemap) {
		this.agemap = agemap;
	}
	
	public  AgeAction()
	{
		this.agemap = new HashMap();
		
		for(int i = 0; i< 120; i++)
		{
			this.agemap.put(new Integer(i), i + "");
		}
	}

}
