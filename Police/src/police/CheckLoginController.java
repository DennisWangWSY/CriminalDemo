package police;
import model.Criminals;
import model.Users;
import police.MD5;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;


public class CheckLoginController extends Controller {
	public void index(){
		String inputRandomCode = getPara("captcha");
		String userName = getPara("username");
		String password = getPara("password");
        boolean validate = MyCaptchaRender.validate(this, inputRandomCode);
        if(!validate){
        	//首先检查验证码
        	this.render("checkerror.jsp");
        }
        else{
        	Users user = Users.me.findFirst("select * from users where name='"+userName+"'");
        	
        	if(user==null){
        		//该用户不存在
        		this.render("usererror.jsp");
        	}
        	else{
        		if(user.getStr("password").equals(MD5.GetMD5Code(password))){
        			//密码正确
        			setSessionAttr("loggedin", "0");
        			setSessionAttr("name",user.getStr("name"));
        			if(user.getStr("type").equals("organizer")){
        				//管理员登录成功
        				setSessionAttr("type", "o");
        				this.redirect("/organizer/userorgan/1");
        			}
        			else{
        				//公安人员登录成功
        				setSessionAttr("type","u");
        				this.redirect("/organizer");
        			}
        		}
        		else{
        			//密码错误
        			this.render("passworderror.jsp");
        		}
        	}
        	
        }
	}
}
