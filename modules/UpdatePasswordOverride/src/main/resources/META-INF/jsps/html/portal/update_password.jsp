        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
		taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
		taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
		taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />

		<portlet:defineObjects />
<%@ page import="com.liferay.portal.kernel.exception.UserPasswordException" %>
<%@ page import="com.liferay.portal.kernel.servlet.SessionErrors" %>
<%@ page import="com.liferay.portal.kernel.service.PasswordPolicyLocalServiceUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.liferay.portal.kernel.model.PasswordPolicy" %>
		<%@ page import="com.liferay.portal.kernel.util.HttpComponentsUtil" %>
		<%@ page import="com.liferay.portal.kernel.util.PortalUtil" %>
		<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %><%--
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

<%@ include file="/html/portal/init.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

<style>

	.password-policy-msg i.fa.fa-check {
		color: #1697F3;
		font-size: 15px;
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
		height: 101%;
		width: 100%;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background-color: #f4f6f9;
		padding:0px 35px;
	}

	.welcome {
		color: #001B3A;
		font-family: sans-serif;
		font-size: 26px;
		letter-spacing: -0.49px;
		line-height: 27px;
		display: flex;
		justify-content: flex-start;
		width: 368px;
		max-width: 100%;
		margin-left: 20px;
		margin-bottom: -27px;
	}

	.passData {
		position: relative;
		z-index: 1;
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
	}
	.sign-in-btn:hover button {
		background-color: #1697F3;
		color: white;
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
		color: #001C3B;
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
	.equalTo{
		color: #E02020;
		font-family: sans-serif;
		font-size: 12px;
		letter-spacing: 0;
		line-height: 13px;
		width: 100%;
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
		height: 101vh;
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

	#loader {
		/*position: fixed;*/
		display: none;
		z-index: 2;
		position: absolute;
		top: 46%;
		left: 42%;
	}
	#loader img {
		width: 76px;
	}
	.sign-in-btn{
		margin-left: 25px;
	}
	.validation-msg{
		font-size: 13px;
		line-height: 24px;
	}
	#password-text{
		width: 105%;

	}
	.has-error .form-feedback-item {
		margin-bottom: -15px;
	}
	.oldpassword {
		margin-left: -17px;
		margin-top: -30px;
		z-index: -1;
	}
	.notcontainPassword{
		display: none;
		width: 100%;
	}
	.fa.fa-check {
		margin-top: 3px;
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
			font-size: 23px;
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
		.containPasswordmsg{
			display: none;
		}
		.notcontainPassword{
			display: inline-block;
		}
		.validation-msg {
			margin-left: 17px;
			font-weight: bold;
			font-size: 12px;
			width: 80% !important;
		}
		span.validation-msg.last-msg {
			margin-bottom: 0px !important;
		}
		.pbar{
			width: 95% !important;
		}
		#loader {
			position: absolute;
			top: 48%;
			left: 42%;
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
		.containPasswordmsg{
			display: none;
		}
		.notcontainPassword{
			display: inline-block;
		}
		.validation-msg {
			font-weight: bold;
			font-size: 12px;
		}
		span.validation-msg.last-msg {
			margin-bottom: 0px !important;
		}
		.pbar{
			width: 96% !important;
		}
		#loader {
			position: absolute;
			top: 48%;
			left: 42%;
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
		body {
			background-color: #f4f6f9;
		}
		.containPasswordmsg{
			display: none;
		}
		.notcontainPassword{
			display: inline-block;
		}
		.validation-msg {
			margin-left: 17px;
			font-weight: bold;
			font-size: 12px;
		}
		span.validation-msg.last-msg {
			margin-bottom: 0px !important;
		}
		.pbar{
			width: 96% !important;
		}
		#loader {
			position: absolute;
			top: 48%;
			left: 42%;
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
		body {
			background-color: #f4f6f9;
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
		body {
			background-color: #f4f6f9;
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
		.col-md-8.col-lg-8.img-wrap.p-0 {
			margin-bottom: -6px !important;
		}
		body {
			background-color: #f4f6f9;
		}
	}
</style>
<%
	String currentURL = PortalUtil.getCurrentURL(request);

	String referer = ParamUtil.getString(request, WebKeys.REFERER, currentURL);

	Ticket ticket = (Ticket) request.getAttribute(WebKeys.TICKET);

	String ticketKey = ParamUtil.getString(request, "ticketKey");

	if (referer.startsWith(themeDisplay.getPathMain() + "/portal/update_password") && Validator.isNotNull(ticketKey)) {
		referer = themeDisplay.getPathMain();
	}


	int text = 1;
%>
<div class="loginportlet">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-8 col-lg-8 img-wrap p-0">
			<img src="https://cxmktintdev-cdn.lfgwcemex.services/documents/d/market-intelligence-portal/logo-white_wip" alt="cemexLogo">
		</div>
		<div class="col-md-4 col-lg-4 p-0">
			<div class="login-portlet-central">
				<div class="credential-dg">
<%--					<div class="language-selector">--%>
<%--						<select id="languageSelector" onchange="changeLanguage(this.value)">--%>
<%--							<option value="en">English (US)</option>--%>
<%--							<option value="fr">French (FR)</option>--%>
<%--							<option value="hr">Croatian (HR)</option>--%>
<%--							<option value="es">Spanish (ES)</option>--%>
<%--							<option value="de">German (DE)</option>--%>
<%--							<option value="pl">Polish (PL)</option>--%>
<%--						</select>--%>
<%--					</div>--%>

					<div id="loader">
						<img src="https://cxmktintdev-cdn.lfgwcemex.services/documents/d/market-intelligence-portal/output-onlinegiftools" alt="Loading..." />
					</div>
						<div class="custom-sheet custom-sheet-lg">
							<div class="sheet-header">
								<div class="autofit-padded-no-gutters-x autofit-row">
									<div class="autofit-col autofit-col-expand">
										<h2 class="sheet-title welcome">
											<liferay-ui:message key="change-password" />
										</h2>
									</div>


									<liferay:ui-language id="language" value="" />

<%--									<div class="float-right">--%>

<%--										<%--%>
<%--											String updateLanguageFormAction = HttpComponentsUtil.addParameter(themeDisplay.getPathMain() + "/portal/update_language", "p_l_id", themeDisplay.getPlid());--%>

<%--											String updateLanguageRedirect = HttpComponentsUtil.addParameter(PortalUtil.getCurrentURL(request), "ticketKey", ParamUtil.getString(request, "ticketKey"));--%>

<%--											updateLanguageFormAction = HttpComponentsUtil.addParameter(updateLanguageFormAction, "redirect", updateLanguageRedirect);--%>
<%--										%>--%>

<%--										<liferay-ui:language--%>
<%--												formAction="<%= updateLanguageFormAction %>"--%>
<%--												languageId="<%= themeDisplay.getLanguageId() %>"--%>
<%--												languageIds="<%= LocaleUtil.toLanguageIds(LanguageUtil.getAvailableLocales(themeDisplay.getSiteGroupId())) %>"--%>
<%--												id="language";--%>
<%--										/>--%>
<%--									</div>--%>
<%--									<div class="autofit-col">--%>
<%--										<%@ include file="/html/portal/select_language.jspf" %>--%>
<%--									</div>--%>
								</div>
							</div>

							<div class="sheet-text">
								<% PasswordPolicy passwordPolicy = null; %><c:choose>
								<c:when test="<%=!themeDisplay.isSignedIn() && (ticket == null)%>">
										<div class="alert alert-warning">
											<liferay-ui:message key="your-password-reset-link-is-no-longer-valid" />

											<%
												PortletURL portletURL = PortletURLFactoryUtil.create(request, PortletKeys.LOGIN, PortletRequest.RENDER_PHASE);

												portletURL.setParameter("mvcRenderCommandName", "/login/forgot_password");
												portletURL.setWindowState(WindowState.MAXIMIZED);
											%>

											<div class="reset-link-contaner">
												<aui:a href="<%=portletURL.toString()%>" label="request-a-new-password-reset-link"></aui:a>
											</div>
										</div>
									</c:when>
								<c:when test="<%=SessionErrors.contains(request, UserLockoutException.LDAPLockout.class.getName())%>">
										<div class="alert alert-danger">
											<liferay-ui:message key="this-account-is-locked" />
										</div>
									</c:when>
								<c:when test="<%=SessionErrors.contains(request, UserLockoutException.PasswordPolicyLockout.class.getName())%>">
										<div class="alert alert-danger">

											<%
												UserLockoutException.PasswordPolicyLockout ule = (UserLockoutException.PasswordPolicyLockout) SessionErrors.get(request, UserLockoutException.PasswordPolicyLockout.class.getName());

												Format dateFormat = FastDateFormatFactoryUtil.getDateTime(FastDateFormatConstants.SHORT, FastDateFormatConstants.LONG, locale, TimeZone.getTimeZone(ule.user.getTimeZoneId()));
											%>

											<liferay-ui:message arguments="<%=dateFormat.format(ule.user.getUnlockDate())%>" key="this-account-is-locked-until-x" translateArguments="<%=false%>" />
										</div>
									</c:when>
								<c:otherwise>
									<aui:form action='<%=themeDisplay.getPathMain() + "/portal/update_password"%>' method="post" name="fm" cssClass="sign-in-form">
										<aui:input name="p_l_id" type="hidden" value="<%=layout.getPlid()%>" />
										<aui:input name="p_auth" type="hidden" value="<%=AuthTokenUtil.getToken(request)%>" />
										<aui:input name="doAsUserId" type="hidden" value="<%=themeDisplay.getDoAsUserId()%>" />
										<aui:input name="<%=Constants.CMD%>" type="hidden" value="<%=Constants.UPDATE%>" />
										<aui:input name="<%=WebKeys.REFERER%>" type="hidden" value="<%=referer%>" />
										<aui:input name="ticketKey" type="hidden" value="<%=ticketKey%>" />

										<c:if test="<%=!SessionErrors.isEmpty(request)%>">
												<div class="alert alert-danger">
													<c:choose>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustBeLonger.class.getName())%>">

															<%
																UserPasswordException.MustBeLonger upe = (UserPasswordException.MustBeLonger) SessionErrors.get(request, UserPasswordException.MustBeLonger.class.getName());
															%>

															<liferay-ui:message arguments="<%=String.valueOf(upe.minLength)%>" key="that-password-is-too-short" translateArguments="<%=false%>" />
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustComplyWithModelListeners.class.getName())%>">
															<liferay-ui:message key="that-password-is-invalid-please-enter-a-different-password" />
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustComplyWithRegex.class.getName())%>">

															<%
																UserPasswordException.MustComplyWithRegex upe = (UserPasswordException.MustComplyWithRegex) SessionErrors.get(request, UserPasswordException.MustComplyWithRegex.class.getName());
															%>

															<liferay-ui:message arguments="<%=upe.regex%>" key="that-password-does-not-comply-with-the-regular-expression" translateArguments="<%=false%>" />
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustHaveMoreAlphanumeric.class.getName())%>">

															<%
																UserPasswordException.MustHaveMoreAlphanumeric upe = (UserPasswordException.MustHaveMoreAlphanumeric) SessionErrors.get(request, UserPasswordException.MustHaveMoreAlphanumeric.class.getName());
															%>

															<liferay-ui:message arguments="<%=String.valueOf(upe.minAlphanumeric)%>" key="that-password-must-contain-at-least-x-alphanumeric-characters" translateArguments="<%=false%>" />
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustHaveMoreLowercase.class.getName())%>">

															<%
																UserPasswordException.MustHaveMoreLowercase upe = (UserPasswordException.MustHaveMoreLowercase) SessionErrors.get(request, UserPasswordException.MustHaveMoreLowercase.class.getName());
															%>

															<liferay-ui:message arguments="<%=String.valueOf(upe.minLowercase)%>" key="that-password-must-contain-at-least-x-lowercase-characters" translateArguments="<%=false%>" />
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustHaveMoreNumbers.class.getName())%>">

															<%
																UserPasswordException.MustHaveMoreNumbers upe = (UserPasswordException.MustHaveMoreNumbers) SessionErrors.get(request, UserPasswordException.MustHaveMoreNumbers.class.getName());
															%>

															<liferay-ui:message arguments="<%=String.valueOf(upe.minNumbers)%>" key="that-password-must-contain-at-least-x-numbers" translateArguments="<%=false%>" />
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustHaveMoreSymbols.class.getName())%>">

															<%
																UserPasswordException.MustHaveMoreSymbols upe = (UserPasswordException.MustHaveMoreSymbols) SessionErrors.get(request, UserPasswordException.MustHaveMoreSymbols.class.getName());
															%>

															<liferay-ui:message arguments="<%=String.valueOf(upe.minSymbols)%>" key="that-password-must-contain-at-least-x-symbols" translateArguments="<%=false%>" />
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustHaveMoreUppercase.class.getName())%>">

															<%
																UserPasswordException.MustHaveMoreUppercase upe = (UserPasswordException.MustHaveMoreUppercase) SessionErrors.get(request, UserPasswordException.MustHaveMoreUppercase.class.getName());
															%>

															<liferay-ui:message arguments="<%=String.valueOf(upe.minUppercase)%>" key="that-password-must-contain-at-least-x-uppercase-characters" translateArguments="<%=false%>" />
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustMatch.class.getName())%>">
															<div class="error-msg-dg">
															<liferay-ui:message key="the-passwords-you-entered-do-not-match" />
															</div>
														</c:when>
<%--														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustNotBeEqualToCurrent.class.getName())%>">--%>
<%--															<div class="error-msg-dg">--%>
<%--															<liferay-ui:message key="your-new-password-cannot-be-the-same-as-your-old-password-please-enter-a-different-password" />--%>
<%--															</div>--%>
<%--														</c:when>--%>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustNotBeNull.class.getName())%>">
														<div class="error-msg-dg">
															<liferay-ui:message key="the-password-cannot-be-blank" />
														</div>
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustNotBeRecentlyUsed.class.getName())%>">
														<div class="error-msg-dg">
															<liferay-ui:message key="that-password-has-already-been-used-please-enter-a-different-password" />
														</div>
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustNotBeTrivial.class.getName())%>">
														<div class="error-msg-dg">
															<liferay-ui:message key="that-password-uses-common-words-please-enter-a-password-that-is-harder-to-guess-i-e-contains-a-mix-of-numbers-and-letters" />
														</div>
														</c:when>
														<c:when test="<%=SessionErrors.contains(request, UserPasswordException.MustNotContainDictionaryWords.class.getName())%>">
														<div class="error-msg-dg">
															<liferay-ui:message key="that-password-uses-common-dictionary-words" />
														</div>
														</c:when>
														<c:otherwise>
															<liferay-ui:message key="your-request-failed-to-complete" />
														</c:otherwise>
													</c:choose>
												</div>
											</c:if>

										<aui:fieldset>
											<div class="passData aui-input-field">
												<aui:input autoFocus="<%=true%>" class="lfr-input-text-container" label="new-password" name="password1" onkeyup="isGood(this.value)"
														   placeholder="enter-password"
														   showRequiredLabel="<%=false%>" type="password">
													<aui:validator name="required" />
												</aui:input>
												<span class="help-block" id="password-text"></span>
												<div class="eye-icon-dg"><i class="far fa-eye" id="togglePassword1" style="margin-left: -30px; cursor: pointer;"></i></div>
												<c:if test="<%=SessionErrors.contains(request, UserPasswordException.MustNotBeEqualToCurrent.class.getName())%>">
													<div class="error-msg-dg alert-danger portlet-msg-error oldpassword">
														<liferay-ui:message key="your-new-password-cannot-be-the-same-as-your-old-password" />
													</div>
												</c:if>
											</div>


												<%
													List<PasswordPolicy> passwordPolicies = PasswordPolicyLocalServiceUtil.getPasswordPolicies(0, PasswordPolicyLocalServiceUtil.getPasswordPoliciesCount());
													passwordPolicy = passwordPolicies.get(0);
													for (PasswordPolicy p : passwordPolicies) {
														if (p.getName().equals("Reset Password Policy")) {
															passwordPolicy = p;
														}
													}
												%>
											<div class="containPasswordmsg">
												<c:if test="<%=passwordPolicy.getMinUpperCase() > 0%>">
											<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;margin-top: 15px;' class="validation-msg">
												<liferay-ui:message arguments="<%=passwordPolicy.getMinUpperCase()%>" key="that-password-must-contain-at-least-x-uppercase-characters" translateArguments="<%=false%>"/>
												</span>
												<span>
													<i class="fa fa-check" aria-hidden="true" id="uppercase" style="float: right;margin-top: 18px;"></i>
												</span>
											</div>
											</c:if>
											<c:if test="<%=passwordPolicy.getMinLowerCase() > 0%>">
											<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;' class="validation-msg">
														<liferay-ui:message arguments="<%=passwordPolicy.getMinLowerCase()%>" key="that-password-must-contain-at-least-x-lowercase-characters" translateArguments="<%=false%>" />
												</span>
												<span>
											<i class="fa fa-check" aria-hidden="true" id="lowercase" style="float: right;"></i>
												</span>
											</div>
											</c:if>
											<c:if test="<%=passwordPolicy.getMinNumbers() > 0%>">
											<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;' class="validation-msg">
														<liferay-ui:message arguments="<%=passwordPolicy.getMinNumbers()%>" key="that-password-must-contain-at-least-x-numbers" translateArguments="<%=false%>" />
												</span>
												<span>
															<i class="fa fa-check" aria-hidden="true" id="minnumber" style="float: right;"></i>
												</span>
											</div>
											</c:if>
											<c:if test="<%=passwordPolicy.getMinSymbols() > 0%>">
											<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;' class="validation-msg">
														<liferay-ui:message arguments="<%=passwordPolicy.getMinSymbols()%>" key="that-password-must-contain-at-least-x-symbols" translateArguments="<%=false%>" />
											</span>
												<span>
															<i class="fa fa-check" aria-hidden="true" id="character" style="float: right;"></i>
												</span>
											</div>
											</c:if>
											<c:if test="<%=passwordPolicy.getMinLength() > 0%>">
											<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;margin-bottom: 20px;' class="validation-msg">
														<liferay-ui:message arguments="<%=passwordPolicy.getMinLength()%>" key="that-password-is-too-short" translateArguments="<%=false%>" />
											</span>
												<span>
															<i class="fa fa-check" aria-hidden="true" id="minlength" style="float: right;"></i>
												</span>
											</div>
											</c:if>
											</div>

											<div class="notcontainPassword">
												<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;margin-top: 15px;' class="validation-msg">
												<liferay-ui:message key="password-must-contain" translateArguments="<%=false%>"/>
												</span>
												</div>
											<c:if test="<%=passwordPolicy.getMinUpperCase() > 0%>">
												<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;margin-top: 15px;' class="validation-msg">
												<liferay-ui:message arguments="<%=passwordPolicy.getMinUpperCase()%>" key="at-least-x-uppercase-characters" translateArguments="<%=false%>"/>
												</span>
													<span>
													<i class="fa fa-check" aria-hidden="true" id="uppercase1" style="float: right;margin-top: 18px;"></i>
												</span>
												</div>
											</c:if>
											<c:if test="<%=passwordPolicy.getMinLowerCase() > 0%>">
												<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;' class="validation-msg">
														<liferay-ui:message arguments="<%=passwordPolicy.getMinLowerCase()%>" key="at-least-x-lowercase-characters" translateArguments="<%=false%>" />
												</span>
													<span>
											<i class="fa fa-check" aria-hidden="true" id="lowercase1" style="float: right;"></i>
												</span>
												</div>
											</c:if>
											<c:if test="<%=passwordPolicy.getMinNumbers() > 0%>">
												<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;' class="validation-msg">
														<liferay-ui:message arguments="<%=passwordPolicy.getMinNumbers()%>" key="at-least-x-numbers" translateArguments="<%=false%>" />
												</span>
													<span>
															<i class="fa fa-check" aria-hidden="true" id="minnumber1" style="float: right;"></i>
												</span>
												</div>
											</c:if>
											<c:if test="<%=passwordPolicy.getMinSymbols() > 0%>">
												<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;' class="validation-msg">
														<liferay-ui:message arguments="<%=passwordPolicy.getMinSymbols()%>" key="at-least-x-symbols" translateArguments="<%=false%>" />
											</span>
													<span>
															<i class="fa fa-check" aria-hidden="true" id="character1" style="float: right;"></i>
												</span>
												</div>
											</c:if>
											<c:if test="<%=passwordPolicy.getMinLength() > 0%>">
												<div class="password-policy-msg" style='width: 100%;'>
												<span style='width: 90%;float:left;margin-bottom: 20px;' class="validation-msg last-msg">
														<liferay-ui:message arguments="<%=passwordPolicy.getMinLength()%>" key="at-that-password-is-too-short" translateArguments="<%=false%>" />
											</span>
													<span>
															<i class="fa fa-check" aria-hidden="true" id="minlength1" style="float: right;"></i>
												</span>
												</div>
											</c:if>
											</div>

											<div class="passData aui-input-field">
												<aui:input class="lfr-input-text-container" label="confirm-password"
														   placeholder="enter-password"
														   name="password2" showRequiredLabel="<%=false%>" type="password">
													<aui:validator name="equalTo" errorMessage="Make sure that both passwords match.">
														'#<portlet:namespace />password1'
													</aui:validator>

													<aui:validator name="required" />
												</aui:input>
												<div class="eye-icon-dg"><i class="far fa-eye" id="togglePassword2" style="margin-left: -30px; cursor: pointer;"></i></div>
<%--												<span class="equalTo error-msg-dg alert-danger portlet-msg-error" style="display: none"><liferay-ui:message key="the-passwords-you-entered-do-not-match" /></span>--%>
											</div>
											</aui:fieldset>
										<aui:button-row>
												<div class="sign-in-btn"><aui:button type="submit" class="sign-in-label"/></div>
											</aui:button-row>
										</aui:form>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
				</div>
		</div>
	</div>
</div>

<aui:script>

	const togglePassword1 = document.querySelector('#togglePassword1');
	const password1 = document.querySelector('#password1');
	togglePassword1.addEventListener('click', function (e) {
	const type1 = password1.getAttribute('type') === 'password' ? 'text' : 'password';
	password1.setAttribute('type', type1);
	this.classList.toggle('fa-eye-slash');
	});

	const togglePassword2 = document.querySelector('#togglePassword2');
	const password2 = document.querySelector('#password2');
	togglePassword2.addEventListener('click', function (e) {
	const type2 = password2.getAttribute('type') === 'password' ? 'text' : 'password';
	password2.setAttribute('type', type2);
	password2.classList.toggle('fa-eye-slash');
	});

</aui:script>

<script>

		document.body.classList.add("login-page");


	if(document.querySelector(".alert.alert-danger").innerHTML.includes("Your request failed to complete")){
		document.querySelectorAll(".passData")[0].classList.add("error");
		document.querySelectorAll(".eye-icon-dg")[0].classList.add("error");
		document.querySelector(".alert.alert-danger").remove();
	}
	document.querySelector("input#password1").addEventListener('input', function (e) {
			if(document.querySelector(".oldpassword")!=null && document.querySelector(".oldpassword").innerHTML.includes("Your new password cannot be the same as your old password")){
				document.querySelector(".oldpassword").remove();
				document.querySelectorAll(".passData")[0].classList.remove("error");
				document.querySelectorAll(".eye-icon-dg")[0].classList.remove("error");
			}
	});


</script>

<script>
	var allPassed  = 0 ;
	function isGood(password) {
		var password_strength = document.getElementById("password-text");


		//TextBox left blank.
		if (password.length == 0) {
			password_strength.innerHTML = "";
			var allIcons = document.querySelectorAll(".password-policy-msg .fa");
			for(var i=0;i<allIcons.length;i++){
				allIcons[i].style.display="none";
			}
			return;
		}

		var upperCase = "[A-Z]";
		var lowerCase = "[a-z]";
		var numeric = "[0-9]";
		var character = "[$@$!+=;:~`^(){}%*#?&]";

		var passed = 0;

		var x = document.querySelector(".containPasswordmsg");
		if(window.getComputedStyle(x).display === "none")
		{
			if(password.length>="<%=passwordPolicy.getMinLength()%>")
			{
				document.getElementById("minlength1").style.display = "inline-block";
				passed++;
			}
			else{
				document.getElementById("minlength1").style.display="none";
			}
			if("<%=passwordPolicy.getMinUpperCase()%>">0 && new RegExp(upperCase).test(password))
			{
				document.getElementById("uppercase1").style.display="inline-block";
				passed++;
			}
			else{
				document.getElementById("uppercase1").style.display="none";
			}
			if("<%=passwordPolicy.getMinLowerCase()%>">0 && new RegExp(lowerCase).test(password))
			{
				document.getElementById("lowercase1").style.display="inline-block";
				passed++;
			}
			else{
				document.getElementById("lowercase1").style.display="none";
			}
			if("<%=passwordPolicy.getMinNumbers()%>">0 && new RegExp(numeric).test(password))
			{
				document.getElementById("minnumber1").style.display="inline-block";
				passed++;
			}
			else{
				document.getElementById("minnumber1").style.display="none";
			}
			if("<%=passwordPolicy.getMinSymbols()%>">0 && new RegExp(character).test(password))
			{
				document.getElementById("character1").style.display="inline-block";
				passed++;
			}
			else{
				document.getElementById("character1").style.display="none";
			}
		}
		else {
			if (password.length >= "<%=passwordPolicy.getMinLength()%>") {
				document.getElementById("minlength").style.display = "inline-block";
				passed++;
			} else {
				document.getElementById("minlength").style.display = "none";
			}
			if ("<%=passwordPolicy.getMinUpperCase()%>" > 0 && new RegExp(upperCase).test(password)) {
				document.getElementById("uppercase").style.display = "inline-block";
				passed++;
			} else {
				document.getElementById("uppercase").style.display = "none";
			}
			if ("<%=passwordPolicy.getMinLowerCase()%>" > 0 && new RegExp(lowerCase).test(password)) {
				document.getElementById("lowercase").style.display = "inline-block";
				passed++;
			} else {
				document.getElementById("lowercase").style.display = "none";
			}
			if ("<%=passwordPolicy.getMinNumbers()%>" > 0 && new RegExp(numeric).test(password)) {
				document.getElementById("minnumber").style.display = "inline-block";
				passed++;
			} else {
				document.getElementById("minnumber").style.display = "none";
			}
			if ("<%=passwordPolicy.getMinSymbols()%>" > 0 && new RegExp(character).test(password)) {
				document.getElementById("character").style.display = "inline-block";
				passed++;
			} else {
				document.getElementById("character").style.display = "none";
			}
		}

		var strength ="";
		switch (passed) {
			case 0:
			case 1:
			case 2:
			case 3:
				strength = "<div style='width: 95%;' class='pbar'><span style='width: 80%;float:left;background-color: #D6D6D6;'><span class='progress-bar' style='background-color: #EE3D42;width: 40%;height: 13px;'></span></span><span style='float:right; margin-top: -5px;'>Weak</span></div>";
				break;
			case 4:
				strength = "<div style='width: 95%;' class='pbar'><span style='width: 80%;float:left;background-color: #D6D6D6;'><span class='progress-bar' style='background-color: #EE3D42;width: 60%;height: 13px;'></span></span><span style='float:right; margin-top: -5px;'>Medium</span></div>";
				break;
			case 5:
				strength = "<div style='width: 95%;' class='pbar'><span style='width: 80%;float:left;background-color: #D6D6D6;'><span class='progress-bar' style='background-color: #7AC943;width: 100%;height: 13px;'></span></span><span style='float:right; margin-top: -5px;'>Strong</span></div>";
				allPassed =1;
				break;

		}
		password_strength.innerHTML = strength;
		if(allPassed==1 && passed>4)
		{
			document.querySelector(".sign-in-btn button").disabled=false;
		}
		else {
			document.querySelector(".sign-in-btn button").disabled=true;
		}

	}


	var passwordP = "<%=passwordPolicy.getName()%>";
	document.querySelector(".sign-in-form").addEventListener("submit", function(event)  {
		var password1 = document.querySelector("#password1").value;
		var password2 = document.querySelector("#password2").value;
		if(password1 != "" && password2 !="" && allPassed==1 && password1==password2){
			document.getElementById("loader").style.display = "block";
			document.querySelector(".login-portlet-central").querySelector(".sign-in-form").style.filter = "blur(1px)";
			return true;
		}
	});
</script>

	<script type="text/javascript">


		function changeLanguage(lang) {
			localStorage.setItem("selectedLanguage", lang);
			 <%--"<%=themeDisplay.setLanguageId("fr")%>"--%>
			document.cookie = "selectedLanguage=" + lang;
			//window.location.reload();
			// window.location.pathname = lang + '/web/marketplacesite/login-page';
		};

		window.addEventListener('load', (event) =>{

			const selectedLanguage = localStorage.getItem("selectedLanguage");
			if (window.location.pathname.includes("/"+selectedLanguage+"/") && selectedLanguage) {
				document.getElementById("languageSelector").value = selectedLanguage;
			}

		});

	</script>


	<script>
		document.querySelector("input#password2").addEventListener('input', function (e) {
			var password1  =document.querySelector("input#password1").value;
			var password2 = document.querySelector("input#password2").value;
			if(password1!=password2){
				document.querySelectorAll(".passData")[1].classList.add("error");
				document.querySelectorAll(".eye-icon-dg")[1].classList.add("error");
			}
			else
			{
				document.querySelectorAll(".passData")[1].classList.remove("error");
				document.querySelectorAll(".eye-icon-dg")[1].classList.remove("error");
			}
		});
	</script>