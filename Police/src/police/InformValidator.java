package police;

import model.Inform;
import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * BlogValidator.
 */
public class InformValidator extends Validator {
	
	protected void validate(Controller controller) {
		validateRequired("inform.criminal","criminalMsg","请输入被举报人id");
		validateRequiredString("inform.title", "titleMsg", "请输入标题!");
		validateRequiredString("inform.content", "contentMsg", "请输入内容!");
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Inform.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/inform/save"))
			controller.render("addinform.jsp");
		else if (actionKey.equals("/inform/update"))
			controller.render("editinform.jsp");
	}
}
