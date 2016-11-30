package model;

import com.jfinal.plugin.activerecord.Page;

public class Inform extends InformBase<Inform> {
	public static final Inform me = new Inform();
	
	/**
	 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
	 */
//	public Page<Users> paginate(int pageNumber, int pageSize) {
//		return paginate(pageNumber, pageSize, "select *", "from users order by id asc");
//	}
}
