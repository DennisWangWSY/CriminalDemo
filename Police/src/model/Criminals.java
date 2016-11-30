package model;

import com.jfinal.plugin.activerecord.Page;

public class Criminals extends CriminalBase<Criminals> {
	public static final Criminals me = new Criminals();
	
	/**
	 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
	 */
	public int numOfCriminals(){
		return me.find("select * from criminals").size();
	}
}
