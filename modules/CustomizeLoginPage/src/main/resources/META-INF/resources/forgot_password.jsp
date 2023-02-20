<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /** * Copyright (c) 2000-present Liferay, Inc. All rights reserved. * * This library is free software; you can
    redistribute it and/or modify it under * the terms of the GNU Lesser General Public License as published by the Free
    * Software Foundation; either version 2.1 of the License, or (at your option) * any later version. * * This library
    is distributed in the hope that it will be useful, but WITHOUT * ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more * details.
    */ --%>

<%@ include file="/init.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script>
    window.addEventListener('load', (event) => {
        if( document.querySelector(".lexicon-icon") != null) {
            document.querySelector(".lexicon-icon").classList.remove("lexicon-icon-reload");
            document.querySelector(".lexicon-icon").classList.add("lexicon-icon-reset");
            let useElement = document.querySelector("use");
            let currentHref = useElement.getAttribute('href');
            let newHref = currentHref.split('#')[0] + '#reset';
            useElement.setAttribute('href', newHref);
        }
    });
</script>
<style>
    .alert-container.cadmin.container {
        display: none;
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

    .forgot-password {
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
        margin-bottom: 30px;
        margin-left: 20px;
    }

     .forgot-password-content {
        color: #001B3A;
        font-family: sans-serif;
        font-size: 18px;
        letter-spacing: -0.44px;
        line-height: 20px;
        display: flex;
        width: 100%;
        max-width: 360px;
        justify-content: flex-start;
        margin-left: 20px;
        margin-bottom: 19px;
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

    .aui-input-field.error input,
    .aui-input-field.error input.form-control:focus
    {
        background-color: rgba(238,61,66,0.2) !important;
        border:1px solid #EE3D42 !important;
    }
    .aui-input-field.error label {
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
        background: #fff;
        padding: 0px 5px;
    }


    .aui-input-field {
        display: flex;
        flex-direction: column;
        width: 370px;
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
        margin:-6px !important;
        height:103vh;
    }

    .forgot-page .loginportlet {
        margin-left: -12px;
        margin-right: -12px;
        height: 100vh;
        display: flex;
    }

    .forgot-page {
        height: 100vh;
        overflow: hidden;
    }

    .forgot-page input:-internal-autofill-selected {
        background-color: #fff !important;
    }

    .alert-info {
        background-color: transparent;
        border: none;
        width: 388px;
        font-size: 16px;
        margin-left: -3px;
        margin-top: -30px;
        color: #001B3A;
    }

    .forgot-password-btn button {
        height: 36px;
        width: 370px;
        border-radius: 70px;
        background-color: #D6D6D6;
        border: none;
        color: #666666;
        font-family: sans-serif;
    }

    .forgot-password-btn:hover button {
        background-color: #1697F3;
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
        margin-left: -14px;
        font-weight: 500;
        margin-top: -12px;
    }
    .back-btn{
        font-size: 18px;
        position: absolute;
        left: 22%;
        top: 8.85%;
        font-family: sans-serif;
    }
    a.back-icon:hover{
        color:#1697F3;
        text-decoration: none;
    }
    .back-icon{
        color: #1697F3;
        font-size: 18px;
    }
    #error-user-not-found{
        display: none;
        color: #EE3D42;
    }

    .language-selector{
        font-size: 18px;
        font-weight: 500;
        font-family: sans-serif;
        position: absolute;
        left: 57%;
        top: 9%;
    }
    #languageSelector{
        background: transparent;
        border: none;
        color: #3FA9F5;
        background-color: #f4f6f9;
    }
    .inputs-dg{
        position: relative;
        top: -8%;
    }
    .
    .form-group.input-text-wrapper.has-error {
        width: auto !important;
        margin-top: -10px !important;
    }
    .form-group.input-text-wrapper {
        margin-top: -6px;
    }
    .c-inner {
        font-size: 22px;
    }
    .lfr-portal-tooltip, .lfr-portal-tooltip a {
        margin-top: 8px;
    }
    .lexicon-icon {
        transform: rotate(290deg) scaleX(-1);
        color: #1697F3;
    }
    .captcha-div .form-group.input-text-wrapper {
        width: 51.5%;
    }
    @media (max-width: 449px) {
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 20%;
            top: 19%;
        }
        .logo-tagline img {
            width: 73%;
        }
        img#_com_liferay_login_web_portlet_LoginPortlet_captcha {
            height: 45px;
            width: 35%;
        }
        .aui-input-field label {
            font-size: 10px;
            margin-left: 5px;
        }
        span.align-top.d-inline-block.refresh.lfr-portal-tooltip {
            margin-right: 10px;
        }
        svg.lexicon-icon.lexicon-icon-reset {
            margin-left: 2px;
        }
        .captcha-div .form-group.input-text-wrapper {
            width: 45.5%;
        }
        .login-portlet-central {
            margin: 0px;
        }
        .inputs-dg{
            position: relative;
            left: 9%;
            top: 18%;
            width: 79%;
        }
        .forgot-password {
            font-size: 19px;
            font-weight: 600;
            width: 320px;
            max-width: 100%;
            margin-bottom: 5px;
        }
        .forgot-password-content {
            font-size: 15px;
            width: 81%;
            margin-bottom: 20px;
        }
        .forgot-password-btn button {
            width: 100%;
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .aui-input-field
        {
            width: 100%;
        }
        .language-selector{
            position: absolute;
            left: 52%;
            top: 12.25%;
            font-size: 16px;
        }
        .back-btn {
            position: absolute;
            left: 19%;
            top: 12%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .col-md-4.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        .col-md-8.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        body {
            background-color: #f4f6f9;
        }
        .alert.alert-dismissible.alert-danger {
            width: 124%;
            margin-top: -12px;
            font-size: 11px;
        }
    }
    @media (max-width: 510px) and (min-width: 450px) {
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 19%;
            top: 19%;
        }
        .logo-tagline img {
            width: 75%;
        }
        img#_com_liferay_login_web_portlet_LoginPortlet_captcha {
            width: 34%;
            height: 43px;
        }
        .captcha-div .form-group.input-text-wrapper {
            width: 45.5%;
        }
        span.align-top.d-inline-block.refresh.lfr-portal-tooltip {
            margin-right: 18px;
        }
        svg.lexicon-icon.lexicon-icon-reset {
            margin-top: -14px;
            margin-left: 6px;
        }
        .login-portlet-central {
            margin: 0px;
        }
        .inputs-dg{
            position: relative;
            left: 9%;
            top: 18%;
            width: 79%;
        }
        .forgot-password {
            font-size: 23px;
            font-weight: 600;
            width: 320px;
            max-width: 100%;
            margin-bottom: 5px;
        }
        .forgot-password-content {
            font-size: 15px;
            width: 81%;
            margin-bottom: 20px;
        }
        .forgot-password-btn button {
            width: 100%;
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .aui-input-field
        {
            width: 100%;
        }
        .language-selector{
            position: absolute;
            left: 56%;
            top: 12.25%;
            font-size: 16px;
        }
        .back-btn {
            position: absolute;
            left: 19%;
            top: 12%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .col-md-4.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        .col-md-8.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        body {
            background-color: #f4f6f9;
        }
        .alert.alert-dismissible.alert-danger {
            width: 124%;
            margin-top: -12px;
            font-size: 11px;
        }
    }
    @media (max-width: 576px) and (min-width: 511px) {
        .login-portlet-central {
            margin: 0px;
        }
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 24%;
            top: 20%;
        }
        .logo-tagline img {
            width: 75%;
        }
        span.align-top.d-inline-block.refresh.lfr-portal-tooltip {
            margin-right: 13px;
        }
        img#_com_liferay_login_web_portlet_LoginPortlet_captcha {
            width: 35%;
        }

        .inputs-dg{
            position: relative;
            left: 9%;
            top: 25%;
            width: 86%;
        }
        .forgot-password {
            font-size: 26px;
            width: 320px;
            max-width: 100%;
        }
        .forgot-password-content {
            font-size: 15px;
            width: 81%;
        }
        .forgot-password-btn button {
            width: 100%;
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .aui-input-field
        {
            width: 100%;
        }
        .language-selector{
            position: absolute;
            left: 59%;
            top: 12.25%;
            font-size: 16px;
        }
        .back-btn {
            position: absolute;
            left: 23%;
            top: 12%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .col-md-4.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        .col-md-8.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        body {
            background-color: #f4f6f9;
        }
    }
    @media (max-width: 760px) and (min-width: 577px)  {
        .login-portlet-central {
            margin: 0px;
        }
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 30%;
            top: 20%;
        }
        .logo-tagline img {
            width: 66%;
        }
        .inputs-dg{
            position: relative;
            left: 11%;
            top: 23%;
            width: 94%;
        }
        .forgot-password {
            font-size: 26px;
            width: 320px;
            max-width: 100%;
        }
        .forgot-password-content {
            font-size: 15px;
            width: 81%;
        }
        .forgot-password-btn button {
            width: 100%;
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .aui-input-field
        {
            width: 100%;
        }
        .language-selector{
            position: absolute;
            left: 62%;
            top: 12.25%;
            font-size: 16px;
        }
        .back-btn {
            position: absolute;
            left: 31%;
            top: 12%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .col-md-4.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        .col-md-8.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        body {
            background-color: #f4f6f9;
        }
        span.align-top.d-inline-block.refresh.lfr-portal-tooltip {
            margin-right: 13px;
        }
        img#_com_liferay_login_web_portlet_LoginPortlet_captcha {
            width: 37%;
        }
    }
    @media (max-width: 820px) and (min-width: 761px) {
        .login-portlet-central {
            margin: 0px;
        }
        .logo-tagline{
            display: inline-block;
            position: absolute;
            left: 32%;
            top: 20%;
        }
        .logo-tagline img {
            width: 66%;
        }
        .inputs-dg{
            position: relative;
            left: 12%;
            top: 23%;
            width: 94%;
        }
        .forgot-password {
            font-size: 26px;
            width: 320px;
            max-width: 100%;
        }
        .forgot-password-content {
            font-size: 15px;
            width: 81%;
            margin-bottom: 15px;
        }
        .forgot-password-btn button {
            width: 100%;
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .aui-input-field
        {
            width: 100%;
        }
        .language-selector{
            position: absolute;
            left: 62%;
            top: 12.25%;
            font-size: 16px;
        }
        .back-btn {
            position: absolute;
            left: 33%;
            top: 12%;
        }
        .col-md-8.img-wrap.p-0{
            display: none;
        }
        .col-md-4.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        .col-md-8.p-0 {
            max-width: none !important;
            flex: none !important;
        }
        body {
            background-color: #f4f6f9;
        }
        span.align-top.d-inline-block.refresh.lfr-portal-tooltip {
            margin-right: 13px;
        }
        img#_com_liferay_login_web_portlet_LoginPortlet_captcha {
            width: 37%;
        }
    }
    @media (max-width: 1020px) and (min-width: 821px) {
        .captcha-div .form-group.input-text-wrapper {
            width: 100%;
            margin-top: 10px;
        }
        .img-wrap img {
            height: 110px;
            width: 460px;
            position: absolute;
            left: 17%;
            top: 40%;
        }
        .login-portlet-central {
            margin: 3px;
        }
        .inputs-dg{
            position: relative;
            left: 17%;
            top: 8%;
            width: 80%;
        }
        .forgot-password {
            font-size: 23px;
            width: 320px;
            max-width: 100%;
        }
        .forgot-password-content {
            font-size: 15px;
            width: 81%;
        }
        .forgot-password-btn button {
            width: 100%;
            margin-top: 0px;
            margin-bottom: 0px;
            height: 100%;
        }
        .aui-input-field
        {
            width: 100%;
        }
        .language-selector{
            position: absolute;
            left: 61%;
            top: 9%;
            font-size: 16px;
        }
        .back-btn {
            position: absolute;
            left: 19%;
            top: 8.85%;
        }
        body {
            background-color: #f4f6f9;
        }
        .alert.alert-dismissible.alert-danger {
            width: 122%;
        }
    }
    @media (max-width: 1280px) and (min-width: 1019px) {

        .alert.alert-dismissible.alert-danger {
            width: 122%;
        }
        .captcha-div .form-group.input-text-wrapper {
            width: 100%;
            margin-top: 10px;
        }
        .img-wrap img {
            height: 120px;
            width: 560px;
            position: absolute;
            left: 17%;
            top: 40%;
        }
        .login-portlet-central {
            margin: 3px;
        }
        .inputs-dg{
            position: relative;
            left: 17%;
            top: 8%;
            width: 80%;
        }
        .forgot-password {
            font-size: 26px;
            width: 320px;
            max-width: 100%;
        }
        .forgot-password-content {
            font-size: 15px;
            width: 81%;
        }
        .forgot-password-btn button {
            width: 100%;
             margin-top: 0px;
             margin-bottom: 0px;
            height: 100%;
        }
        .aui-input-field
        {
            width: 100%;
        }
        .language-selector{
            position: absolute;
            left: 61%;
            top: 9%;
            font-size: 16px;
        }
        .back-btn {
            position: absolute;
            left: 27%;
            top: 8.85%;
        }
        body {
            background-color: #f4f6f9;
        }
    }

</style>
<% User user2=(User)request.getAttribute(WebKeys.FORGOT_PASSWORD_REMINDER_USER);
    if (Validator.isNull(authType))
    {
        authType=company.getAuthType();
    }
    String login=(String)portletSession.getAttribute(WebKeys.FORGOT_PASSWORD_REMINDER_USER_EMAIL_ADDRESS);
    Integer reminderAttempts=(Integer)portletSession.getAttribute(WebKeys.FORGOT_PASSWORD_REMINDER_ATTEMPTS);
    if (reminderAttempts==null)
    {
        reminderAttempts=0;
    }
    renderResponse.setTitle(LanguageUtil.get(request, "forgot-password" )); %>

<%@ page import="com.liferay.portal.kernel.service.UserLocalServiceUtil" %>
<%@ page import="com.liferay.portal.kernel.model.User" %>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<%
    int noUserFound = 0;
    if(user2!=null) {

        User u = UserLocalServiceUtil.getUserByEmailAddress(themeDisplay.getCompanyId(), user2.getEmailAddress());
        if(u.getEmailAddress().equals("default@liferay.com"))
        {
            user2=null;
            noUserFound = 1;
        }
        else {
            noUserFound = 2;
        }
    }

%>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 col-lg-8 img-wrap p-0">
<%--            <c:choose>--%>
<%--                <c:when test="<%= user2 == null %>">--%>
                <img src="https://cxmktintdev-cdn.lfgwcemex.services/documents/d/market-intelligence-portal/logo-white_wip" alt="cemexLogo">
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                <img src="https://cxmktintdev-cdn.lfgwcemex.services/documents/d/market-intelligence-portal/cemexlogo2" alt="cemexLogo">--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
        </div>
        <div class="col-md-4 col-lg-4 p-0">
            <portlet:actionURL name="/login/forgot_password" var="forgotPasswordURL">
                <portlet:param name="mvcRenderCommandName" value="/login/forgot_password" />
            </portlet:actionURL>


            <div class="login-portlet-central">
              <div class="credential-dg">
                <div class="back-btn">
                            <a id="back-url" href="#" class="back-icon"><i style='font-size:18px;margin-right:7px;' class='fas'>&#xf104;</i><liferay-ui:message key="back" /></a>
                </div>

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
                  <div class="inputs-dg">
                  <div class="forgot-password"><liferay-ui:message key="forgot-your-password" /></div>
                <div class="forgot-password-content">
                    <c:if test="<%= user2 == null %>">
                        <liferay-ui:message key="enter-your-email-address-and-we-will-send-you-a-link-to-reset-your-password" />
                        </c:if></div>
                <div class="login-container">
                    <aui:form action="<%= forgotPasswordURL %>" method="post" name="fm"  cssClass="forgot-pwd-form">
                    <aui:input name="saveLastPath" type="hidden" value="<%= false %>" />

                    <div class="error-msg-dg">
                        <liferay-ui:error exception="<%= CaptchaConfigurationException.class %>"
                                          message="a-captcha-error-occurred-please-contact-an-administrator" />
                        <liferay-ui:error exception="<%= CaptchaException.class %>"
                                          message="captcha-verification-failed" />
                        <liferay-ui:error exception="<%= CaptchaTextException.class %>"
                                          message="text-verification-failed" />
<%--                        <liferay-ui:error exception="<%= NoSuchUserException.class %>"--%>
<%--                                          message='<%= "the-" + TextFormatter.format(HtmlUtil.escape(authType), TextFormatter.K) + "-you-requested-is-not-registered-in-our-database" %>' />--%>
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


                    </div>
                    <aui:fieldset>
                    <c:choose>
                    <c:when test="<%= user2 == null %>">

                    <% String loginLabel=null; if
                    (authType.equals(CompanyConstants.AUTH_TYPE_EA)) {
                        loginLabel="email" ; } else if
                    (authType.equals(CompanyConstants.AUTH_TYPE_SN)) {
                        loginLabel="screen-name" ; } else if
                    (authType.equals(CompanyConstants.AUTH_TYPE_ID)) { loginLabel="id" ;
                    } %>

                    <aui:input name="step" type="hidden" value="1" />

                    <c:if test="<%= !PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsKeys.USERS_REMINDER_QUERIES_ENABLED, PropsValues.USERS_REMINDER_QUERIES_ENABLED) %>">
                        <portlet:renderURL var="redirectURL">
                            <portlet:param name="mvcRenderCommandName"
                                           value="/login/login" />
                        </portlet:renderURL>

                        <aui:input name="redirect" type="hidden"
                                   value="<%= redirectURL %>" />
                    </c:if>


                        <div class="aui-input-field email-field">
                        <aui:input label="<%= loginLabel %>" name="login" size="30"
                                   type="text" value="<%= login %>" placeholder="enter-your-email" cssClass="emailAddress">
                            <aui:validator name="required" />
                        </aui:input>
                            <div class="error-msg-dg">
                            <liferay-ui:error exception="<%= NoSuchUserException.class %>"
                                              message='the-email-you-entered-is-not-associated-with-an-account' />
                            </div>

                            <span class="error-msg-dg" id="error-user-not-found">
<%--                                 <liferay-ui:error exception="<%= NoSuchUserException.class %>"--%>
<%--                                                   message='<%= "the-" + TextFormatter.format(HtmlUtil.escape(authType), TextFormatter.K) + "-you-requested-is-not-registered-in-our-database" %>' />--%>
                                <liferay-ui:message key="the-email-you-entered-is-not-associated-with-an-account"/>
                            </span>
                        </div>


                        <div class="aui-input-field captcha-div">
                            <c:if test="<%= captchaConfiguration.sendPasswordCaptchaEnabled() %>">
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
                                                   name="answer" type="password" placeholder="write-your-answer-here" />
                                        <div class="error-msg-dg"> <liferay-ui:error exception="<%= UserReminderQueryException.class %>"
                                                                                     message="the-answer-you-entered-is-incorrect" /></div>
                                    </div>

                                </c:if>

                                <c:choose>
                                    <c:when test="<%= PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsKeys.USERS_REMINDER_QUERIES_REQUIRED, PropsValues.USERS_REMINDER_QUERIES_REQUIRED) && !user2.hasReminderQuery() %>">
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
                            </aui:form>
                </div>

              </div>
            </div>
        </div>
        </div>
        </div>



                <script>
                    if(document.querySelector(".error-msg-dg .alert") != null){
                        document.querySelector(".form-group").style.marginBlock="0px";
                        document.querySelector(".form-group").style.zIndex="1";
                        var errorelements = document.getElementsByClassName("aui-input-field");
                        errorelements[0].classList.add("error");
                        var div = document.querySelector(".error-msg-dg .alert");
                        var but = div.querySelector(".close");
                        but.remove();
                        var al = div.querySelector(".alert-indicator");
                        al.remove();
                        var l = div.querySelector(".lead");
                        l.remove();
                    }
                </script>
                <script>
                    document.querySelector(".forgot-pwd-form").addEventListener("submit", function(event)  {
                        var errorField1= document.querySelector(".email-field").querySelector(".input-text-wrapper").getElementsByTagName('input')[0].value;
                        var errorField2 = document.querySelector(".captcha-div").querySelectorAll(".input-text-wrapper")[0].getElementsByTagName('input')[0].value;
                        if(errorField1 == "" || errorField2 =="") {
                                document.querySelector(".login-portlet-central").style.top="5%";
                        }
                    });
                </script>
        <script>
            var us = '<%=noUserFound%>';
            var  hostname = window.location.protocol+"//" +window.location.hostname;
            if(us==0 || us==1)
            {
                document.getElementById("back-url").href=hostname + ":8080/web/marketplacesite/login-page";
            }
            else {
                document.getElementById("back-url").href = document.referrer;
            }
        </script>
        <aui:script>
        var ast = document.querySelectorAll(".aui-input-field .reference-mark");

        for(var i=0;i<ast.length;i++)
        {
        ast[i].remove();
        }

        </aui:script>

        <script>
            if(document.getElementsByClassName("autofit-float autofit-row portlet-header").length >0)
            {
                document.getElementsByClassName("autofit-float autofit-row portlet-header")[0].remove();
            }
        </script>

        <script>
            var us = '<%=noUserFound%>';
            if(us==2)
            {
                document.querySelector(".forgot-password-btn").style.marginTop="50px";
            }
        </script>
        <script>
            var noUser = '<%= noUserFound %>';
            var errorMsg = document.getElementById("error-user-not-found")
            if(noUser==1)
            {
                errorMsg.style.display = "block";
                document.querySelector(".form-group").style.marginBlock="0px";
                var errorelements = document.getElementsByClassName("aui-input-field");
                        errorelements[0].classList.add("error");
            }
        </script>

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

        <aui:script>

        if (document.querySelectorAll("div.forgot-password-content").length > 0) {
        document.body.classList.add("forgot-page");
        }

            </aui:script>



            