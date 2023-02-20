package forgotpasswordoverridingmvcrender.portlet;

import com.liferay.login.web.constants.LoginPortletKeys;
import com.liferay.portal.kernel.model.Company;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import forgotpasswordoverridingmvcrender.constants.ForgotPasswordOverridingMVCRenderPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

/**
 * @author root322
 */
@Component(
		property = {
				// "javax.portlet.name=" + LoginPortletKeys.FAST_LOGIN,
				"javax.portlet.name=" + LoginPortletKeys.LOGIN,
				"mvc.command.name=/login/forgot_password",
				"service.ranking:Integer=200"
		},
		service = MVCRenderCommand.class
)
public class ForgotPasswordOverridingMVCRenderPortlet implements MVCRenderCommand {
	@Override
	public String render(
			RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {

		System.out.println("Render Ovverrided");
//        ThemeDisplay themeDisplay = (ThemeDisplay)renderRequest.getAttribute(
//                WebKeys.THEME_DISPLAY);
//
//        Company company = themeDisplay.getCompany();
//
//        if (!company.isSendPasswordResetLink()) {
//            return "/forgot_password.jsp";
//        }
		String email = renderRequest.getParameter("login");
				//ParamUtil.getString(renderRequest, "_com_liferay_login_web_portlet_LoginPortlet_login");
		System.out.println("email got: "+email);
		return mvcRenderCommand.render(renderRequest, renderResponse);
	}
	@Reference(
			target = "(component.name=com.liferay.login.web.internal.portlet.action.ForgotPasswordMVCRenderCommand)")
	protected MVCRenderCommand mvcRenderCommand;
}