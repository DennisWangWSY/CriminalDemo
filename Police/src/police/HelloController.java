package police;

import org.eclipse.jetty.util.security.Credential;
import org.eclipse.jetty.util.security.Credential.MD5;

import com.jfinal.core.Controller;
public class HelloController extends Controller {
	public void index() {
		setSessionAttr("loggedin","1");
		setSessionAttr("name","");
		setSessionAttr("type","");
		render("homepage.jsp");
		//this.render("test.html");
	}
	public void logged(){
		if("0".equals(getSessionAttr("loggedin")))	this.render("loggedhomepage.jsp");
		else this.redirect("/");;
	}
	public void captcha()
	{
		render(new MyCaptchaRender(60,22,4,true));
	}
	public void img()
	{
		System.out.println("img");
		//System.out.println(getPara(0));
		render(new MyPhotoRender(getPara(0)));
	}
	public void login()
	{
		render("login.jsp");
	}
}