package forgotpasswordoverridedmvcaction.portlet;

import com.liferay.login.web.constants.LoginPortletKeys;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.WebKeys;
import forgotpasswordoverridedmvcaction.constants.ForgotPasswordOverridedMVCActionPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

/**
 * @author root322
 */
@Component(
		property = {
				"javax.portlet.name=" + LoginPortletKeys.FAST_LOGIN,
				"javax.portlet.name=" + LoginPortletKeys.LOGIN,
				"mvc.command.name=/login/forgot_password",
				"service.ranking:Integer=200"
		},
		service = MVCActionCommand.class
)
public class ForgotPasswordOverridedMVCActionPortlet extends BaseMVCActionCommand {
	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {

		ThemeDisplay themeDisplay = (ThemeDisplay)actionRequest.getAttribute(
				WebKeys.THEME_DISPLAY);
		String email = actionRequest.getParameter("login");
		User u  = UserLocalServiceUtil.getUserByEmailAddress(themeDisplay.getCompanyId(),email);
		mvcActionCommand.processAction(actionRequest, actionResponse);
	}

	@Reference(target = "(component.name=com.liferay.login.web.internal.portlet.action.ForgotPasswordMVCActionCommand)")

	protected MVCActionCommand mvcActionCommand;
}