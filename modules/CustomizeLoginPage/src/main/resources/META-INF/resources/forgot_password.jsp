<%-- /** * Copyright (c) 2000-present Liferay, Inc. All rights reserved. * * This library is free software; you can
    redistribute it and/or modify it under * the terms of the GNU Lesser General Public License as published by the Free
    * Software Foundation; either version 2.1 of the License, or (at your option) * any later version. * * This library
    is distributed in the hope that it will be useful, but WITHOUT * ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more * details.
    */ --%>

    <%@ include file="/init.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <style>
            body {
                margin: 0px;
                padding: 0px;
            }

            .panel-body {
                padding: 0.75rem 1.25rem;
            }

            .img-wrap {
                overflow: hidden;
            }

            .img-wrap img {
                width: 100%;
            }

            .login-portlet-central {
                display: flex;
                position: relative;
                height: 100%;
                width: 100%;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            .login-portlet-central .forgot-password {
                color: #001B3A;
                font-family: SANS-SERIF;
                font-size: 24px;
                display: flex;
                width: 100%;
                font-weight: 500;
                max-width: 360px;
                justify-content: flex-start;
            }

            .login-portlet-central .forgot-password-content {

                color: #001B3A;
                font-family: sans-serif;
                font-size: 18px;
                letter-spacing: -0.44px;
                line-height: 20px;
                display: flex;
                width: 100%;
                margin-top: 12px;
                max-width: 360px;
                justify-content: flex-start;

            }


            .aui-input-field input {
                height: 45px;
                margin-top: -12px;
                z-index: -1;
                padding: 10px 20px;
                border-radius: 10px;
                background-color: #fff;
                border: 1px solid #B0B0B0;
            }
            
            
            .aui-input-field.error input {
                background-color: rgba(238, 61, 66, 0.2);
                border: 1px solid #EE3D42;

            }

            .aui-input-field.error label {
                color: #EE3D42;
                background-color: rgba(238, 61, 66, 0.2);
            }

            .aui-input-field label {
                margin-left: 10px;
                font-weight: 500;
                color: #001C3B;
                font-family: sans-serif;
                font-size: 12px;
                letter-spacing: 0;
                line-height: 13px;
                background: #fff;
                padding: 0px 5px;
            }
            
           
            .aui-input-field {
                display: flex;
                flex-direction: column;
                width: 362px;
                margin: 0 auto;
                justify-content: flex-start;
                background-color: transparent;
            }

            .login-container .aui-input-field {
                display: flex;
                flex-direction: column;
                width: 362px;
                justify-content: flex-start;
                background-color: transparent;

            }

            .captcha-field img {
                margin-top: 15px;
                background-color: #003876;
            }

            .taglib-captcha .form-group {
                display: inline-block !important;
                vertical-align: top !important;
            }


            .forgot-page .container-fluid,
            .forgot-page .container,
            .forgot-page .portlet-content {
                width: 100% !important;
                max-width: 100% !important;
                padding: 0px !important;
            }

            .forgot-page .portlet-icon-back {
                display: none;
            }

            .forgot-page .row {
                margin: -6px !important;
            }

            .forgot-page .loginportlet {
                margin-left: -12px;
                margin-right: -12px;
            }

            .forgot-page {
                height: 100vh;
                overflow: hidden;
            }

            .forgot-page input:-internal-autofill-selected {
                background-color: #fff !important;
            }

            .email-field {
                margin-top: 30px;
            }

            .alert-info {
               border-color: #ffffff;
               background-color: #ffffff;
               width: 362px;
               color: #001B3A;
            }

            /* .form-control:focus{
	background-color:#fff !important;
	border:inherit !important;
} */

            .forgot-password-btn {
                margin-top: 30px;
                text-align: center;
            }

            .forgot-password-btn button {
                height: 36px;
                width: 362px;
                border-radius: 70px;
                background-color: #D6D6D6;
                border: none;
                color: #666666;
                font-family: sans-serif;
                margin-top: 10px;
            }

            .forgot-password-btn:hover button {
                background-color: #7AC943;
            }

            .error-msg-dg {}

            .error-msg-dg .alert-danger,
            .portlet-msg-error {
                background-color: white !important;
                border-color: white !important;
                color: #EE3D42;
                font-family: sans-serif;
                font-size: 12px;
                letter-spacing: 0;
                line-height: 11px;
                width: 410px;
                margin-bottom: -12px;
                margin-top: 7px;
                font-weight: 500;
            }
        </style>
        <% User user2=(User)request.getAttribute(WebKeys.FORGOT_PASSWORD_REMINDER_USER); if (Validator.isNull(authType))
            { authType=company.getAuthType(); } String
            login=(String)portletSession.getAttribute(WebKeys.FORGOT_PASSWORD_REMINDER_USER_EMAIL_ADDRESS); Integer
            reminderAttempts=(Integer)portletSession.getAttribute(WebKeys.FORGOT_PASSWORD_REMINDER_ATTEMPTS); if
            (reminderAttempts==null) { reminderAttempts=0; }
            renderResponse.setTitle(LanguageUtil.get(request, "forgot-password" )); %>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8 img-wrap p-0">
                        <img src="https://cxmktintdev-cdn.lfgwcemex.services/documents/d/market-intelligence-portal/cemex-loginpage" alt="cemexLogo">
                    </div>
                    <div class="col-md-4 p-0">
                        <portlet:actionURL name="/login/forgot_password" var="forgotPasswordURL">
                            <portlet:param name="mvcRenderCommandName" value="/login/forgot_password" />
                        </portlet:actionURL>

                        <div class="login-portlet-central">
                            <div class="forgot-password">Forgot your password?</div>
                            <div class="forgot-password-content"><c:if test="<%= user2 == null %>">Enter your email address and we will send you a link to
                                reset your password.</c:if></div>
                            <div class="login-container">
                                <aui:form action="<%= forgotPasswordURL %>" method="post" name="fm">
                                    <aui:input name="saveLastPath" type="hidden" value="<%= false %>" />

                                    <div class="error-msg-dg">
                                        <liferay-ui:error exception="<%= CaptchaConfigurationException.class %>"
                                            message="a-captcha-error-occurred-please-contact-an-administrator" />
                                        <liferay-ui:error exception="<%= CaptchaException.class %>"
                                            message="captcha-verification-failed" />
                                        <liferay-ui:error exception="<%= CaptchaTextException.class %>"
                                            message="text-verification-failed" />
                                        <liferay-ui:error exception="<%= NoSuchUserException.class %>"
                                            message='<%= "the-" + TextFormatter.format(HtmlUtil.escape(authType), TextFormatter.K) + "-you-requested-is-not-registered-in-our-database" %>' />
                                        <liferay-ui:error exception="<%= RequiredReminderQueryException.class %>"
                                            message="you-have-not-configured-a-reminder-query" />
                                        <liferay-ui:error exception="<%= SendPasswordException.MustBeEnabled.class %>"
                                            message="password-recovery-is-disabled" />
                                        <liferay-ui:error exception="<%= UserActiveException.class %>"
                                            message="your-account-is-not-active" />
                                        <liferay-ui:error
                                            exception="<%= UserEmailAddressException.MustNotBeNull.class %>"
                                            message="please-enter-an-email-address" />
                                        <liferay-ui:error
                                            exception="<%= UserEmailAddressException.MustValidate.class %>"
                                            message="please-enter-a-valid-email-address" />
                                        <liferay-ui:error exception="<%= UserLockoutException.LDAPLockout.class %>"
                                            message="this-account-is-locked" />
                                        <liferay-ui:error
                                            exception="<%= UserLockoutException.PasswordPolicyLockout.class %>">

                                            <% UserLockoutException.PasswordPolicyLockout
                                                ule=(UserLockoutException.PasswordPolicyLockout)errorException; %>

                                                <c:choose>
                                                    <c:when test="<%= ule.passwordPolicy.isRequireUnlock() %>">
                                                        <liferay-ui:message key="this-account-is-locked" />
                                                    </c:when>
                                                    <c:otherwise>

                                                        <% Format
                                                            dateFormat=FastDateFormatFactoryUtil.getDateTime(FastDateFormatConstants.SHORT,
                                                            FastDateFormatConstants.LONG, locale,
                                                            TimeZone.getTimeZone(ule.user.getTimeZoneId())); %>

                                                            <liferay-ui:message
                                                                arguments="<%= dateFormat.format(ule.user.getUnlockDate()) %>"
                                                                key="this-account-is-locked-until-x"
                                                                translateArguments="<%= false %>" />
                                                    </c:otherwise>
                                                </c:choose>
                                        </liferay-ui:error>

                                        <liferay-ui:error exception="<%= UserReminderQueryException.class %>"
                                            message="your-answer-does-not-match-what-is-in-our-database" />
                                    </div>
                                    <aui:fieldset>
                                        <c:choose>
                                            <c:when test="<%= user2 == null %>">

                                                <% String loginLabel=null; if
                                                    (authType.equals(CompanyConstants.AUTH_TYPE_EA)) {
                                                    loginLabel="email-address" ; } else if
                                                    (authType.equals(CompanyConstants.AUTH_TYPE_SN)) {
                                                    loginLabel="screen-name" ; } else if
                                                    (authType.equals(CompanyConstants.AUTH_TYPE_ID)) { loginLabel="id" ;
                                                    } %>

                                                    <aui:input name="step" type="hidden" value="1" />

                                                    <c:if
                                                        test="<%= !PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsKeys.USERS_REMINDER_QUERIES_ENABLED, PropsValues.USERS_REMINDER_QUERIES_ENABLED) %>">
                                                        <portlet:renderURL var="redirectURL">
                                                            <portlet:param name="mvcRenderCommandName"
                                                                value="/login/login" />
                                                        </portlet:renderURL>

                                                        <aui:input name="redirect" type="hidden"
                                                            value="<%= redirectURL %>" />
                                                    </c:if>

                                                    <div class="aui-input-field email-field">
                                                        <aui:input label="<%= loginLabel %>" name="login" size="30"
                                                            type="text" value="<%= login %>" placeholder="Enter Your Email">
                                                            <aui:validator name="required" />
                                                        </aui:input>
                                                    </div>

                                                    <div class="aui-input-field">
                                                        <c:if
                                                            test="<%= captchaConfiguration.sendPasswordCaptchaEnabled() %>">
                                                            <liferay-captcha:captcha />
                                                        </c:if>
                                                    </div>

                                                    <div class="forgot-password-btn">
                                                        <aui:button-row>
                                                            <aui:button type="submit"
                                                                value='<%= PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsKeys.USERS_REMINDER_QUERIES_ENABLED, PropsValues.USERS_REMINDER_QUERIES_ENABLED) ? "next" : "send-new-password" %>' />
                                                        </aui:button-row>
                                                        <div>
                                            </c:when>
                                            <c:when test="<%= user2 != null %>">

                                                <aui:input name="step" type="hidden" value="2" />

                                                <portlet:renderURL var="redirectURL">
                                                    <portlet:param name="mvcRenderCommandName" value="/login/login" />
                                                </portlet:renderURL>

                                                <aui:input name="redirect" type="hidden" value="<%= redirectURL %>" />

                                                <c:if test="<%= Validator.isNotNull(user2.getReminderQueryQuestion()) && Validator.isNotNull(user2.getReminderQueryAnswer()) %>">
                                                   <div class="alert alert-info">
															<liferay-ui:message arguments="<%= HtmlUtil.escape(login) %>" key="An-email-to-retrieve-your-password-will-be-sent-to-x-if-you-answer-the-following-correctly" translateArguments="<%= false %>" />
														</div>

                                                    <div class="aui-input-field">
                                                        <aui:input autoFocus="<%= true %>"
                                                            label="<%= HtmlUtil.escape(LanguageUtil.get(request, user2.getReminderQueryQuestion())) %>"
                                                            name="answer" type="password" />
                                                    </div>

                                                </c:if>

                                                <c:choose>
                                                    <c:when
                                                        test="<%= PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsKeys.USERS_REMINDER_QUERIES_REQUIRED, PropsValues.USERS_REMINDER_QUERIES_REQUIRED) && !user2.hasReminderQuery() %>">
                                                        <div class="alert alert-info">
                                                            <liferay-ui:message
                                                                key="the-password-cannot-be-reset-because-you-have-not-configured-a-reminder-query" />
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="<%= reminderAttempts >= 3 %>">
                                                            <liferay-captcha:captcha />
                                                        </c:if>

                                                        <div class="forgot-password-btn">
                                                            <aui:button-row>
                                                                <aui:button type="submit"
                                                                    value='<%= company.isSendPasswordResetLink() ? "Retrieve password" : "send-new-password" %>' />
                                                            </aui:button-row>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="alert alert-warning">
                                                    <liferay-ui:message
                                                        key="the-system-cannot-send-you-a-new-password-because-you-have-not-provided-an-email-address" />
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </aui:fieldset>
                                    <input type="hidden" id="hidden-email" value="">
                                </aui:form>

                            </div>
                        </div>

                    </div>
                </div>

            </div>

			<aui:script>
			/*
			if(document.getElementById("_com_liferay_login_web_portlet_LoginPortlet_login")!=null)
			{
			var d =document.getElementById("_com_liferay_login_web_portlet_LoginPortlet_login").value;
			console.log(d);
			localStorage.setItem("dem", d);
			}
			var dem = localStorage.getItem("dem");
			console.log("demo: "+dem);
			var dd = document.getElementById("hidden-email").value=dem;
			console.log(dd);
			document.querySelector(".alert").innerHTML="An email to retrieve your password will be sent to "+dem+" if you answer the following correctly:";
           */

            var ast = document.querySelectorAll(".aui-input-field .reference-mark");
            
            for(var i=0;i<ast.length;i++) 
            {
				ast[i].remove();
			}
	
            </aui:script>

            <aui:script>

                if (document.querySelectorAll("div.forgot-password-content").length > 0) {
                document.body.classList.add("forgot-page");
                }
				

                var div = document.querySelector(".error-msg-dg .alert");
                var but = div.querySelector(".close");
                but.remove();
                var al = div.querySelector(".alert-indicator");
                al.remove();
                var l = div.querySelector(".lead");
                l.remove();

            </aui:script>
            