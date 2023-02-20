package forgotpasswordoverridingmvcrender.portlet;

import com.liferay.login.web.constants.LoginPortletKeys;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.WebKeys;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import java.io.FilterOutputStream;

@Component(
        property = {
                 "javax.portlet.name=" + LoginPortletKeys.FAST_LOGIN,
                "javax.portlet.name=" + LoginPortletKeys.LOGIN,
                "mvc.command.name=/login/forgot_password",
                "service.ranking:Integer=200"
        },
        service = MVCActionCommand.class
)
public class ForgotPasswordOverridingMVCActionPortlet extends BaseMVCActionCommand {
    @Override
    protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {

        System.out.println("Action Ovverrided");
        ThemeDisplay themeDisplay = (ThemeDisplay)actionRequest.getAttribute(
                WebKeys.THEME_DISPLAY);
        System.out.println("Theme display compsny id:   "+themeDisplay.getCompanyId());
        String email = actionRequest.getParameter("login");
        System.out.println("email Action: "+email);
        User u  = UserLocalServiceUtil.getUserByEmailAddress(themeDisplay.getCompanyId(),email);
       // System.out.println("user : "+u.getUserId()+"Mail : "+u.getEmailAddress());
        mvcActionCommand.processAction(actionRequest, actionResponse);
    }

    @Reference(target = "(component.name=com.liferay.login.web.internal.portlet.action.ForgotPasswordMVCActionCommand)")

    protected MVCActionCommand mvcActionCommand;
}
