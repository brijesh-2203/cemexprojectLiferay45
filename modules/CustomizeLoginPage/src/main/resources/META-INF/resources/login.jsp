<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>
<%@ include file="/init.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<style>
    #back-url{
        display: none;
    }
    .back-icon {
        color: #1697F3;
        font-size: 18px;
    }
    a.back-icon:hover{
        color:#1697F3;
        text-decoration: none;
    }
    .logo-tagline {
        display: none;
        position: absolute;
        left: 21%;
        top: 17%;
    }
    .logo-tagline img
    {
        width: 70%;
    }

    .img-wrap {
        background: radial-gradient(circle, #0069AE 0%, #003876 100%, #003876 100%);
    }

    .login-portlet-central {
        display: flex;
        position: relative;
        height: 100%;
        width: 100%;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background-color: #f4f6f9;
        padding:0px 35px;
    }

    .welcome {
        height: 38px;
        color: #001B3A;
        font-family: sans-serif;
        font-size: 32px;
        letter-spacing: -0.49px;
        line-height: 27px;
        display: flex;
        justify-content: flex-start;
        width: 368px;
        max-width: 100%;
        border-bottom:2px solid red;
        margin-bottom: 30px;
        margin-left: 20px;
        display: none;
    }

    .welcome2 {
        height: 38px;
        color: #001B3A;
        font-family: sans-serif;
        font-size: 32px;
        letter-spacing: -0.49px;
        line-height: 27px;
        display: flex;
        justify-content: flex-start;
        width: 368px;
        max-width: 100%;
        border-bottom:2px solid red;
        margin-bottom: 30px;
        margin-left: 20px;
    }

    .passData {
        position: relative;
    }
    .eye-icon-dg {
        position: absolute;
        left: 100%;
        top: 27%;
        z-index: 1;
        color: #1697F3;
    }
    .eye-icon-dg.error {
        color: #EE3D42;
    }
    .forgot-pwd .taglib-text{
        color: #1697F3;
    }
    .forgot-button-dg {
        margin-left: 20px;
        margin-top: -30px;
    }
    .sign-in-btn button {
        height: 36px;
        width: 370px;
        border-radius: 70px;
        background-color: #D6D6D6;
        border: none;
        color: #666666;
        font-family: sans-serif;
        margin-top: 15px;
    }
    .sign-in-btn:hover button {
        background-color: #7AC943;
    }


    .aui-input-field input {
        height: 45px;
        margin-top: -12px;
        z-index: -1;
        padding: 10px 20px;
        border-radius: 10px;
        background-color: #fff;
        border:1px solid #B0B0B0;
    }
    .aui-input-field.error input,
    .aui-input-field.error input.form-control:focus
    {
        background-color: rgba(238,61,66,0.2) !important;
        border:1px solid #EE3D42 !important;
    }
    .aui-input-field.error label{
        color: #EE3D42;
    }

    .aui-input-field label {
        margin-left: 10px;
        font-weight: 500;
        color: #001C3B;
        font-family: sans-serif;
        font-size: 12px;
        letter-spacing: 0;
        line-height: 13px;
        background:#fff;
        padding:0px 5px;
    }
    .aui-input-field
    {
        display: flex;
        flex-direction: column;
        width: 370px;
        background-color: transparent;
    }
    .login-page input:-internal-autofill-selected {
        background-color: #fff !important;
    }

    .error-msg-dg .alert-danger, .portlet-msg-error {
        background-color: #f4f6f9 !important;
        border-color: #f4f6f9 !important;
        color: #EE3D42;
        font-family: sans-serif;
        font-size: 12px;
        letter-spacing: 0;
        line-height: 13px;
        width: 100%;
        margin-bottom: -15px;
        margin-top: -16px;
        font-weight: 500;
    }
    .forgot-pwd{
    }
    .form-control:focus{
        background-color:#fff !important;
        border:inherit !important;
        border-color: #B0B0B0 !important;
    }
    .img-wrap img {
        height: 150px;
        width: 650px;
        position: absolute;
        left: 27%;
        top: 40%;
    }
    .login-page .container-fluid,
    .login-page .container,
    .login-page .portlet-content
    {
        width:100% !important;
        max-width:100% !important;
        padding:0px !important;
    }
    .login-page .portlet-icon-back{
        display:none;
    }
    .login-page .row{
        margin:0px !important;
        height:100%;
    }
    .login-page .loginportlet{
        margin-left: -12px;
        margin-right: -12px;
        height: 100vh;
        display: flex;
    }
    .login-page{
        height: 100vh;
        overflow: hidden;
    }
    .language-selector{
        font-size: 18px;
        font-weight: 500;
        font-family: sans-serif;
        position: absolute;
        left: 57%;
        top: 9%;
        z-index: 1;
    }
    #languageSelector{
        background: transparent;
        border: none;
        color: #3FA9F5;
        background-color: #f4f6f9;
    }

    .alert-success, .portlet-msg-success {
        background-color: #7AC943;
        border: none;
        color: white;
        font-family: sans-serif;
        font-weight: bold;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        line-height: 7px;
        height: 40px;
        font-size: 14px;
    }
    .sign-in-btn-selection button{
        height: 100%;
        width: 96%;
        border-radius: 70px;
        background-color: #FFFFFF;
        border: 2px solid #1697F3;
        color: #666666;
        font-family: sans-serif;
        margin-top: 15px;
        color: #1697F3;
        margin-left: 20px;
        font-weight: bold;
        font-family: sans-serif;
    }
    .sign-in-btn-selection button:hover{
        background-color: #1697F3;
        color: white;
    }
    #user-login-form{
        display: none;
    }
    .preference{
        color: #001B3A;
        font-family: sans-serif;
        font-size: 18px;
        letter-spacing: -0.44px;
        line-height: 22px;
        margin-left: 20px;
        margin-bottom: 40px;
    }
    .back-btn{
        font-size: 18px;
        position: absolute;
        left: 22%;
        top: 8.85%;
        font-family: sans-serif;
    }
    @media (max-width: 449px) {
        .back-btn {
            position: absolute;
            left: 19%;
            top: 9%;
        }
        .alert-success, .portlet-msg-success {
            font-size: 12px;
        }
        .aui-input-field {
            width: 100%;
            margin-left: 10px;
        }
        .forgot-pwd .taglib-text {
            position: relative;
            left: 4%;
        }
        .sign-in-btn button {
            width: 95%;
            position: relative;
            left: 3%;
        }
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 21%;
            top: 17%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .logo-tagline img {
            width: 80%;
        }
        .welcome{
            width: 78%;
            margin-left: 37px;
        }
        .error-msg-dg .alert-danger, .portlet-msg-error {
            margin-left: 20px;
        }
        .language-selector{
            position: absolute;
            left: 56%;
            top: 9%;
            font-size: 16px;
        }
        body {
            background-color: #f4f6f9;
        }
        .credential-dg{
            margin-top: 70px;
        }
        .preference{
            display: none;
        }
        .welcome2{
            width: 86%;
            margin-left: 0px;
        }
        .sign-in-btn-selection button{
            height: 36px;
            width: 100%;
            margin-left: 0px;
        }
    }
    @media (max-width: 510px) and (min-width: 450px) {
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 18%;
            top: 17%;
        }
        .back-btn {
            position: absolute;
            left: 18%;
            top: 9%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .logo-tagline img {
            width: 75%;
        }
        .welcome{
            width: 80%;
            margin-left: 24px;
        }
        .aui-input-field {
            width: 330px;
            margin-left: 0px;
        }
        .forgot-pwd .taglib-text {
            position: relative;
            left: 0%;
        }
        .sign-in-btn button {
            width: 95%;
            position: relative;
            left: 0%;
        }
        .error-msg-dg .alert-danger, .portlet-msg-error {
            margin-left: 6px;
        }
        .language-selector{
            position: absolute;
            left: 57%;
            top: 9%;
            font-size: 16px;
        }
        body {
            background-color: #f4f6f9;
        }
        .credential-dg{
            margin-top: 70px;
        }
        .preference{
            display: none;
        }
        .welcome2{
            width: 86%;
            margin-left: 0px;
        }
        .sign-in-btn-selection button{
            height: 100%;
            width: 100%;
            margin-left: 0px;
        }
    }
    @media (max-width: 576px) and (min-width: 511px) {
        .aui-input-field {
            width: 326px;
            margin-left: 15px;
        }
        .back-btn {
            position: absolute;
            left: 24%;
            top: 9%;
        }
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 24%;
            top: 17%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .forgot-pwd .taglib-text {
            position: relative;
            left: 5%;
        }
        .sign-in-btn button {
            width: 90%;
            position: relative;
            left: 5%;
        }
        .welcome{
            width: 78%;
            margin-left: 40px;
        }
        .logo-tagline img {
            width: 75%;
        }
        .language-selector{
            position: absolute;
            left: 57%;
            top: 9%;
            font-size: 16px;
        }
        body {
            background-color: #f4f6f9;
        }
        .credential-dg{
            margin-top: 75px;
        }
        .preference{
            display: none;
        }
        .before-login.aui-input-field {
            margin-left: 16px;
        }
        .welcome2{
            width: 86%;
            margin-left: 0px;
        }
        .sign-in-btn-selection button{
            height: 100%;
            width: 100%;
            margin-left: 0px;
        }
    }
    @media (max-width: 760px) and (min-width: 577px)  {
        .welcome{
            width: 81%;
            margin-left: 25px;
        }
        .back-btn {
            position: absolute;
            left: 26%;
            top: 9%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 27%;
            top: 17%;
        }
        .logo-tagline img {
            width: 60%;
        }
        .language-selector{
            position: absolute;
            left: 58%;
            top: 9%;
            font-size: 16px;
        }
        body {
            background-color: #f4f6f9;
        }
        .credential-dg{
            margin-top: 82px;
        }
        .preference{
            display: none;
        }
        .before-login.aui-input-field {
            margin-left: 16px;
        }
        .welcome2{
            width: 86%;
            margin-left: 0px;
        }
        .sign-in-btn-selection button{
            height: 100%;
            width: 95%;
            margin-left: 0px;
        }
    }
    @media (max-width: 820px) and (min-width: 761px) {
        .credential-dg{
            margin-top: 120px;
        }
        .back-btn {
            position: absolute;
            left: 28%;
            top: 9%;
        }
        .welcome{
            width: 80%;
            position: relative;
            left: 1%
        }
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 28%;
            top: 17%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .login-page .container {
            background-color: #f4f6f9;
        }

        .navbar-brand img {
            width: 115px;
        }
        .col-md-4.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        .col-md-8.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        .logo-tagline img {
            width: 60%;
        }
        .language-selector{
            position: absolute;
            left: 56%;
            top: 9%;
            font-size: 16px;
        }
        body {
            background-color: #f4f6f9;
        }
        .preference{
            display: none;
        }
        .before-login{
            margin-left: 0px;
        }
        .sign-in-btn-selection button {
            margin-left: 0px;
        }
        .welcome2{
            width: 86%;
            margin-left: 0px;
        }
    }
    @media (max-width: 1020px) and (min-width: 821px) {
        .back-btn {
            position: absolute;
            left: 16%;
            top: 8.85%;
        }
        .img-wrap img {
            height: 110px;
            width: 460px;
            position: absolute;
            left: 17%;
            top: 40%;
        }
        .welcome{
            width:86%;
        }
        .welcome2{
            width:86%;
        }
        .aui-input-field
        {
            width: 100%;
        }
        .sign-in-btn button {
            width: 93%;
        }
        .language-selector{
            position: absolute;
            left: 53%;
            top: 9%;
            font-size: 16px;
        }
        .alert-success, .portlet-msg-success {
            height: 35px;
            font-size: 11px;
        }
        .cross-icon{
            font-size: 15px;
        }
    }
    @media (max-width: 1280px) and (min-width: 1019px) {
        .sign-in-btn-selection button{
            height: 100%;
            width: 100%;
            margin-left: 20px;
        }
        .back-btn {
            position: absolute;
            left: 16%;
            top: 8.85%;
        }
        .img-wrap img {
            height: 120px;
            width: 560px;
            position: absolute;
            left: 17%;
            top: 40%;
        }
        .welcome{
            width:86%;
        }
        .welcome2{
            width:86%;
        }
        .aui-input-field
        {
            width: 100%;
        }
        .sign-in-btn button {
            width: 94%;
        }
        .language-selector{
            position: absolute;
            left: 53%;
            top: 9%;
            font-size: 16px;
        }
        .alert-success, .portlet-msg-success {
            height: 37px;
            font-size: 12px;
        }
    }


    #loader {
        display: none;
        z-index: 1;
        position: absolute;
        top: 50%;
        left: 43%;
    }
    img#loader
    {
        width: 80px;
        height: 80px;
    }

</style>


<div class="loginportlet">
    <c:choose>
        <c:when test="<%= themeDisplay.isSignedIn() %>">

            <%
                String signedInAs = HtmlUtil.escape(user.getFullName());

                if (themeDisplay.isShowMyAccountIcon() && (themeDisplay.getURLMyAccount() != null)) {
                    String myAccountURL = String.valueOf(themeDisplay.getURLMyAccount());

                    signedInAs = "<a class=\"signed-in\" href=\"" + HtmlUtil.escape(myAccountURL) + "\">" + signedInAs + "</a>";
                }
            %>

            <liferay-ui:message arguments="<%= signedInAs %>" key="you-are-signed-in-as-x"
                                translateArguments="<%= false %>"/>
        </c:when>
        <c:otherwise>

            <%
                String formName = "loginForm";

                if (windowState.equals(LiferayWindowState.EXCLUSIVE)) {
                    formName += "Modal";
                }

                String redirect = ParamUtil.getString(request, "redirect");

                String login = (String) SessionErrors.get(renderRequest, "login");

                if (Validator.isNull(login)) {
                    login = LoginUtil.getLogin(request, "login", company);
                }

                String password = StringPool.BLANK;
                boolean rememberMe = ParamUtil.getBoolean(request, "rememberMe");

                if (Validator.isNull(authType)) {
                    authType = company.getAuthType();
                }

            %>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8 col-lg-8 img-wrap p-0">
                        <img src="https://cxmktintdev-cdn.lfgwcemex.services/documents/d/market-intelligence-portal/logo-white_wip" alt="cemexLogo">
                    </div>
                    <div class="col-md-4 col-lg-4 p-0">
                        <portlet:actionURL name="/login/login"
                                           secure="<%= PropsValues.COMPANY_SECURITY_AUTH_REQUIRES_HTTPS || request.isSecure() %>"
                                           var="loginURL">
                            <portlet:param name="mvcRenderCommandName" value="/login/login"/>
                        </portlet:actionURL>
                        <div class="login-portlet-central">

                            <div class="back-btn">
                                <a id="back-url" href="http://localhost:8080/web/marketplacesite/login-page" class="back-icon"><i style='font-size:18px;margin-right:7px;' class='fas'>&#xf104;</i><liferay-ui:message key="back" /></a>
                            </div>

                            <div class="credential-dg">
                                <div class="language-selector">
                                    <select id="languageSelector" onchange="changeLanguage(this.value)">
                                        <option value="en">English (US)</option>
                                        <option value="fr">French (FR)</option>
                                        <option value="hr">Croatian (HR)</option>
                                        <option value="es">Spanish (ES)</option>
                                        <option value="de">German (DE)</option>
                                        <option value="pl">Polish (PL)</option>
                                    </select>
                                </div>
                                <div class="logo-tagline">
                                    <img src="https://cxmktintdev-cdn.lfgwcemex.services/documents/d/market-intelligence-portal/logo-color_wip" alt="cemexLogo">
                                </div>

                                <div id="loader">
                                    <img src="https://cxmktintdev-cdn.lfgwcemex.services/documents/d/market-intelligence-portal/output-onlinegiftools" alt="Loading..." />
                                </div>

                                <div class="before-login aui-input-field">
                                    <div class="welcome2"><liferay-ui:message key="welcome" /></div>
                                    <div class="preference"><liferay-ui:message key="choose-your-preffered-login-method"/></div>
                                        <aui:button-row>
                                            <div class="sign-in-btn-cemex-account sign-in-btn-selection"><aui:button type="submit" class="sign-in-label" id="sign-in-with-cemex-account" value="sign-in-with-cemex-account"/></div>
                                        </aui:button-row>
                                        <aui:button-row>
                                            <div class="sign-in-btn-user sign-in-btn-selection"><aui:button type="submit" class="sign-in-label" value="sign-in-with-user-and-password"/></div>
                                        </aui:button-row>
                                </div>
                                <div id="user-login-form">
                                    <div class="welcome"><liferay-ui:message key="welcome" /></div>

                                    <aui:form action="<%= loginURL %>"
                                          autocomplete='<%= PropsValues.COMPANY_SECURITY_LOGIN_FORM_AUTOCOMPLETE ? "on" : "off" %>'
                                          cssClass="sign-in-form" method="post" name="<%= formName %>"
                                          onSubmit="event.preventDefault();" validateOnBlur="<%= false %>">
                                    <aui:input name="saveLastPath" type="hidden" value="<%= false %>"/>
                                    <aui:input name="redirect" type="hidden" value="<%= redirect %>"/>
                                    <aui:input name="doActionAfterLogin" type="hidden"
                                               value="<%= portletName.equals(PortletKeys.FAST_LOGIN) ? true : false %>"/>

                                    <div class="inline-alert-container lfr-alert-container"></div>

                                    <liferay-util:dynamic-include key="com.liferay.login.web#/login.jsp#alertPre"/>

                                    <c:choose>
                                        <c:when test='<%= SessionMessages.contains(request, "forgotPasswordSent") %>'>
                                            <div class="alert alert-success">
                                                <liferay-ui:message key="we-have-sent-you-an-email-to-change-your-password"/>
                                                <i class="fa fa-times cross-icon" aria-hidden="true" style="color:white; cursor: pointer;font-size: 17px;float: right;margin-top: -4px;"></i>
                                            </div>
                                        </c:when>
                                        <c:when test='<%= SessionMessages.contains(request, "userAdded") %>'>

                                            <%
                                                String userEmailAddress = (String) SessionMessages.get(request, "userAdded");
                                            %>

                                            <div class="alert alert-success">
                                                <liferay-ui:message key="thank-you-for-creating-an-account"/>

                                                <c:if test="<%= company.isStrangersVerify() %>">
                                                    <liferay-ui:message arguments="<%= HtmlUtil.escape(userEmailAddress) %>"
                                                                        key="your-email-verification-code-was-sent-to-x"
                                                                        translateArguments="<%= false %>"/>
                                                </c:if>

                                                <c:if test="<%= PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsKeys.ADMIN_EMAIL_USER_ADDED_ENABLED) %>">
                                                    <c:choose>
                                                        <c:when test="<%= PropsValues.LOGIN_CREATE_ACCOUNT_ALLOW_CUSTOM_PASSWORD %>">
                                                            <liferay-ui:message key="use-your-password-to-login"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <liferay-ui:message
                                                                    arguments="<%= HtmlUtil.escape(userEmailAddress) %>"
                                                                    key="you-can-set-your-password-following-instructions-sent-to-x"
                                                                    translateArguments="<%= false %>"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </div>
                                        </c:when>
                                        <c:when test='<%= SessionMessages.contains(request, "userPending") %>'>

                                            <%
                                                String userEmailAddress = (String) SessionMessages.get(request, "userPending");
                                            %>

                                            <div class="alert alert-success">
                                                <liferay-ui:message arguments="<%= HtmlUtil.escape(userEmailAddress) %>"
                                                                    key="thank-you-for-creating-an-account.-you-will-be-notified-via-email-at-x-when-your-account-has-been-approved"
                                                                    translateArguments="<%= false %>"/>
                                            </div>
                                        </c:when>
                                    </c:choose>

                                    <c:if test="<%= PropsValues.SESSION_ENABLE_PERSISTENT_COOKIES && PropsValues.SESSION_TEST_COOKIE_SUPPORT %>">
                                        <div class="alert alert-danger" id="<portlet:namespace />cookieDisabled"
                                             style="display: none;">
                                            <liferay-ui:message key="authentication-failed-please-enable-browser-cookies"/>
                                        </div>
                                    </c:if>
                                    <div class="error-msg-dg">
                                        <liferay-ui:error exception="<%= AuthException.class %>"
                                                          message="the-user-or-password-you-entered-are-incorrect-please-try-again"/>
                                        <liferay-ui:error exception="<%= CompanyMaxUsersException.class %>"
                                                          message="unable-to-log-in-because-the-maximum-number-of-users-has-been-reached"/>
                                        <liferay-ui:error exception="<%= CookieNotSupportedException.class %>"
                                                          message="authentication-failed-please-enable-browser-cookies"/>
                                        <liferay-ui:error exception="<%= NoSuchUserException.class %>"
                                                          message="authentication-failed"/>
                                        <liferay-ui:error exception="<%= PasswordExpiredException.class %>"
                                                          message="your-password-has-expired"/>
                                        <liferay-ui:error exception="<%= UserEmailAddressException.MustNotBeNull.class %>"
                                                          message="please-enter-an-email-address"/>
                                        <liferay-ui:error exception="<%= UserLockoutException.LDAPLockout.class %>"
                                                          message="this-account-is-locked"/>

                                        <liferay-ui:error exception="<%= UserLockoutException.PasswordPolicyLockout.class %>">

                                            <%
                                                UserLockoutException.PasswordPolicyLockout ule = (UserLockoutException.PasswordPolicyLockout) errorException;
                                            %>

                                            <c:choose>
                                                <c:when test="<%= ule.passwordPolicy.isRequireUnlock() %>">
                                                    <liferay-ui:message key="this-account-is-locked"/>
                                                </c:when>
                                                <c:otherwise>

                                                    <%
                                                        Format dateFormat = FastDateFormatFactoryUtil.getDateTime(FastDateFormatConstants.SHORT, FastDateFormatConstants.LONG, locale, TimeZone.getTimeZone(ule.user.getTimeZoneId()));
                                                    %>

                                                    <liferay-ui:message
                                                            arguments="<%= dateFormat.format(ule.user.getUnlockDate()) %>"
                                                            key="this-account-is-locked-until-x"
                                                            translateArguments="<%= false %>"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </liferay-ui:error>

                                        <liferay-ui:error exception="<%= UserPasswordException.class %>"
                                                          message="authentication-failed"/>
                                        <liferay-ui:error exception="<%= UserScreenNameException.MustNotBeNull.class %>"
                                                          message="the-screen-name-cannot-be-blank"/>
                                    </div>
                                    <liferay-util:dynamic-include key="com.liferay.login.web#/login.jsp#alertPost"/>


                                    <aui:fieldset>

                                        <%
                                            String loginLabel = null;

                                            if (authType.equals(CompanyConstants.AUTH_TYPE_EA)) {
                                                loginLabel = "user-name";
                                            } else if (authType.equals(CompanyConstants.AUTH_TYPE_SN)) {
                                                loginLabel = "screen-name";
                                            } else if (authType.equals(CompanyConstants.AUTH_TYPE_ID)) {
                                                loginLabel = "id";
                                            }
                                        %>

                                        <div class="email-field aui-input-field">
                                            <aui:input
                                                    autoFocus="<%= windowState.equals(LiferayWindowState.EXCLUSIVE) || windowState.equals(WindowState.MAXIMIZED) %>"
                                                    cssClass="clearable" label="<%=loginLabel%>" name="login" placeholder="enter-username"
                                                    showRequiredLabel="<%= false %>" type="text">
                                                <aui:validator name="required"/>

                                                <c:if test="<%= authType.equals(CompanyConstants.AUTH_TYPE_EA) %>">
                                                    <aui:validator name="email"/>
                                                </c:if>
                                            </aui:input>
                                        </div>

                                        <div class="passData aui-input-field">
                                            <aui:input name="password" id="txtPassword" class="form-control input-label"
                                                       showRequiredLabel="<%= false %>" type="password" placeholder="enter-password"
                                                       value="<%= password %>">
                                                <aui:validator name="required"/>
                                            </aui:input>
                                            <div class="eye-icon-dg"><i class="far fa-eye" id="togglePassword" style="margin-left: -30px; cursor: pointer;"></i></div>
                                        </div>


                                        <span id="<portlet:namespace />passwordCapsLockSpan"
                                              style="display: none;"><liferay-ui:message key="caps-lock-is-on"/></span>

                                    </aui:fieldset>
                                    <div class="forgot-button-dg"><span class="forgot-pwd"><%@ include file="/navigation.jspf" %></span>
                                        <aui:button-row>
                                            <div class="sign-in-btn"><aui:button type="submit" class="sign-in-label" value="sign-in"/></div>
                                        </aui:button-row>
                                    </div>
                                </aui:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <aui:script sandbox="<%= true %>">
                var form = document.getElementById('<portlet:namespace/><%= formName %>');

                if (form) {
                form.addEventListener('submit', (event) => {
                <c:if test="<%= PropsValues.SESSION_ENABLE_PERSISTENT_COOKIES && PropsValues.SESSION_TEST_COOKIE_SUPPORT %>">
                    if (!navigator.cookieEnabled) {
                    document.getElementById(
                    '<portlet:namespace/>cookieDisabled'
                    ).style.display = '';

                    return;
                    }
                </c:if>

                <c:if test="<%= Validator.isNotNull(redirect) %>">
                    var redirect = form.querySelector('#<portlet:namespace/>redirect');

                    if (redirect) {
                    var redirectVal = redirect.getAttribute('value');

                    redirect.setAttribute('value', redirectVal + window.location.hash);
                    }
                </c:if>

                submitForm(form);
                });

                var password = form.querySelector('#<portlet:namespace/>password');

                if (password) {
                password.addEventListener('keypress', (event) => {
                Liferay.Util.showCapsLock(
                event,
                '<portlet:namespace/>passwordCapsLockSpan'
                );
                });
                }
                }
            </aui:script>
        </c:otherwise>
    </c:choose>
</div>
<aui:script>

    const togglePassword = document.querySelector('#togglePassword');
    const password = document.querySelector('#<portlet:namespace/>txtPassword');
    togglePassword.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
    });

</aui:script>

<aui:script>



    if (document.querySelectorAll("div.welcome").length > 0) {
    document.body.classList.add("login-page");
    }

    var forgotText  = document.querySelectorAll(".forgot-pwd .taglib-text");
    for(var i=0;i<forgotText.length;i++)
    {
       var taglibTxt = forgotText[i].innerHTML;
       if(taglibTxt=="OpenId Connect"){
        document.querySelector(".forgot-pwd").getElementsByTagName("li")[0].remove();
       }
       if(taglibTxt.includes("Forgot")){
             forgotText[i].innerHTML = forgotText[i].innerHTML+"?";
        }
    }


    if(document.querySelector(".error-msg-dg .alert") != null){
    var div = document.querySelector(".error-msg-dg .alert");
    var but = div.querySelector(".close");
    but.remove();
    var al = div.querySelector(".alert-indicator");
    al.remove();
    var l = div.querySelector(".lead");
    l.remove();
    }

    if (document.querySelectorAll("div.error-msg-dg .alert").length > 0) {
    var errorelements = document.getElementsByClassName("aui-input-field");
    for(var i=0;i<errorelements.length;i++)
    {
    errorelements[i].classList.add("error");
    }

    var errorEYEelement = document.getElementsByClassName("eye-icon-dg");
    for(var i=0;i<errorEYEelement.length;i++)
    {
    errorEYEelement[i].classList.add("error");
    }
    }



    if(document.getElementsByClassName("autofit-float autofit-row portlet-header").length >0)
    {
    document.getElementsByClassName("autofit-float autofit-row portlet-header")[0].remove();
    }
</aui:script>

<script type="text/javascript">


    function changeLanguage(lang) {
        sessionStorage.setItem("selectedLanguage", lang);
        window.location.pathname = lang + '/web/marketplacesite/login-page';
    };

    window.addEventListener('load', (event) =>{
        const selectedLanguage = sessionStorage.getItem("selectedLanguage");
        if (window.location.pathname.includes("/"+selectedLanguage+"/") && selectedLanguage) {
            document.getElementById("languageSelector").value = selectedLanguage;
        }

    });

</script>

<script>

    document.querySelector(".sign-in-form").addEventListener("submit", function(event)  {
        var mailFormat="^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
            + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
        var username= document.querySelector(".email-field").querySelector(".input-text-wrapper").getElementsByTagName('input')[0].value;
        var password = document.querySelector(".passData").querySelector(".input-text-wrapper").getElementsByTagName('input')[0].value;
        if(username != "" && password !="" && username.match(mailFormat)){
            if(document.querySelector(".alert.alert-success") !=null) {
                document.querySelector(".alert.alert-success").remove();
            }
            document.getElementById("loader").style.display = "block";
            document.querySelector(".login-portlet-central").querySelector(".input-container").style.filter = "blur(1px)";
        }
    });

</script>

<script>
    document.querySelector(".sign-in-btn-user").addEventListener("click", function(event)  {
        document.querySelector(".before-login").style.display="none";
        document.querySelector("#back-url").style.display="block";
        document.querySelector(".welcome").style.display="block";
        document.querySelector("#user-login-form").style.display="block";
        document.cookie = "selectedUserLoginType=signInWithUserandPassword";
        sessionStorage.setItem("selectedUserLoginType", "signInWithUserandPassword");
    });

</script>

<script>
    if(sessionStorage.getItem("selectedUserLoginType")=="signInWithUserandPassword")
    {
        document.querySelector(".before-login").style.display="none";
        document.querySelector("#back-url").style.display="block";
        document.querySelector(".welcome").style.display="block";
        document.querySelector("#user-login-form").style.display="block";
    }

</script>
<script>
    document.querySelector("#back-url").addEventListener("click", function(event) {
        sessionStorage.setItem("selectedUserLoginType", "selectionSignin");
        document.querySelector("#back-url").style.display="none";
    });
</script>
<script>
    if(document.querySelector(".cross-icon")!=null)
    {
        document.querySelector(".cross-icon").addEventListener("click", function(event) {
            document.querySelector(".alert.alert-success").remove();
        });
    }
</script>
<script>
    document.getElementById("<portlet:namespace />sign-in-with-cemex-account").addEventListener("click", function(event) {
         location.href = "https://cxmktint.lfgwcemex.services/home/-/login/openid_connect_request?&saveLastPath=false&p_p_state=maximized&_com_liferay_login_web_portlet_LoginPortlet_saveLastPath=false&_com_liferay_login_web_portlet_LoginPortlet_redirect=/&_com_liferay_login_web_portlet_LoginPortlet_OPEN_ID_CONNECT_PROVIDER_NAME=CEMEX";
    });
</script>