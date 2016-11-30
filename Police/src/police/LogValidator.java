package police;

import model.Users;
import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * BlogValidator.
 */
public class LogValidator extends Validator {
	
	protected void validate(Controller controller) {
		validateRequiredString("user", "nameMsg", "请输入用户名!");
		validateRequiredString("blog.content", "passMsg", "请输入密码!");
		validateRequiredString("blog.content", "checkMsg", "请输入验证码!");
	}
	
	protected void handleError(Controller controller) {
//		controller.keepModel(Blog.class);
//		
//		String actionKey = getActionKey();
//		if (actionKey.equals("/blog/save"))
//			controller.render("add.html");
//		else if (actionKey.equals("/blog/update"))
//			controller.render("edit.html");
	}
}
