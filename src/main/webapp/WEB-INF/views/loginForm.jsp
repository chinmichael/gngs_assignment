<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<%@ include file="coverTop.jsp"%>
<body>
<div class="container-fluid">
<%--Main Contents--%>

    <div class="row flex-column flex-xl-row" style="margin-bottom: 150px;">
        <form:form modelAttribute="loginVO" action="../login" method="post" name="loginFrm">
    <c:choose>
        <c:when test="${not empty loginError}">
            <div class="alert alert-danger mb-3 mx-auto" role="alert"
                 style="max-width: 20rem; margin-top:40px; font-size: 10pt; text-align: center">
                <i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;${loginError}
            </div>
            <div class="card border-secondary mb-3 mx-auto" style="max-width: 20rem; margin-top: 20px;">
        </c:when>
        <c:otherwise>
            <div class="card border-secondary mb-3 mx-auto" style="max-width: 20rem; margin-top: 60px;">
        </c:otherwise>
    </c:choose>
                <div class="card-header text-center" style="font-weight: bold; color: #6c757d">
                    G&G Service ログイン</div>
                <div class="card-body">
                    <h6 class="card-title" style="font-weight: bold;color: #6c757d">ID :</h6>
                    <form:input path="userid" cssClass="form-control form-control-sm"/>
                    <form:errors path="userid" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    <h6 class="card-title" style="margin-top: 15px;font-weight: bold; color: #6c757d">Password :</h6>
                    <form:password path="userpw" cssClass="form-control form-control-sm"/>
                    <form:errors path="userpw" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    <div class="d-grid gap-2" style="margin-top: 20px;">
                        <button class="btn btn-primary" type="submit">ログイン</button>
                    </div>
                </div>
            </div>
        </form:form></div>
<%--/Main Contents--%>
<%@ include file="coverBottom.jsp"%>
</html>