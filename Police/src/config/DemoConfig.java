package config;

import police.CheckLoginController;
import police.HelloController;
import police.OrganizerController;
import police.UserController;
import model.Users;
import model._MappingKit;

import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
public class DemoConfig extends JFinalConfig {
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setEncoding("utf-8");
		me.setViewType(ViewType.JSP);
	}
	public void configRoute(Routes me) {
		me.add("/", HelloController.class,"/index");
		me.add("/check",CheckLoginController.class,"/check");
		me.add("/user",UserController.class,"/user");
		me.add("/organizer",OrganizerController.class,"/organizer");
	} 
	public void configPlugin(Plugins me) {
		C3p0Plugin c3p0Plugin = new C3p0Plugin("jdbc:mysql://127.0.0.1/police?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull"
				,"root","950308");
		me.add(c3p0Plugin);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
		_MappingKit.mapping(arp);
	}
	public void configInterceptor(Interceptors me) {}
	public void configHandler(Handlers me) {
		me.add(new ContextPathHandler("basePath"));	
		}

	public static void main(String[] args) {
		JFinal.start("WebRoot", 80, "/", 5);
	}
}