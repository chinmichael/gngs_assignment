<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<%@ include file="../coverTop.jsp" %>
<body>
<%@ include file="bpSideNav.jsp" %>

<%--Main Contents--%>
<main class="col bg-faded py-4 flex-grow-1" style="font-family: Meiryo; margin-bottom: 150px; padding-left: 30px; padding-right: 25px;">

    <a href=# data-bs-toggle="modal" data-bs-target="#logMoveModal" style="text-decoration:none;"
       onclick="logMove('BP情報一覧', 'bpList')">BP情報一覧 ></a>
    <a href=# data-bs-toggle="modal" data-bs-target="#logMoveModal" style="text-decoration:none;"
       onclick="logMove('BP詳細情報登録', -1)">BP詳細情報修正 ></a>
    <a style="text-decoration:none;">BP詳細情報修正確認</a>

    <%@ include file="../logMoveModal.jsp"%>

    <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px; margin-top:20px;">
        BP詳細情報修正確認</h3>

    <%--Regist Form--%>
    <form:form modelAttribute="bpInformDetailVO" action="../bp/bpModifyCheckSend" method="post" name="bpModifyCheckFrm">

        <table class="table table-bordered border-secondary">
            <tbody>
            <tr>
                <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">会社(氏)名</th>
                <td>${bpInform.getCorporate_name()}</td>
            </tr>
            <tr>
                <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">BP区分</th>
                <td>
                    <c:choose>
                        <c:when test="${bpInform.getBp_type() == '0'}">
                            顧客
                        </c:when>
                        <c:otherwise>
                            パートナー
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">企業区分</th>
                <td>
                    <c:choose>
                        <c:when test="${bpInform.getCorporate_type1() == '0'}">
                            法人
                        </c:when>
                        <c:when test="${bpInform.getCorporate_type1() == '1'}">
                            自営業
                        </c:when>
                        <c:otherwise>
                            その他
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">契約担当部署名</th>
                <td>${bpInform.getContract_dept()}</td>
            </tr>
            <tr>
                <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">契約担当者名</th>
                <td>${bpInform.getContract_manager()}</td>
            </tr>
            <tr>
                <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">契約担当電話番号</th>
                <td>${bpInform.getContract_tel()}</td>
            </tr>
            <tr>
                <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">契約担当メール</th>
                <td>${bpInform.getContract_mail()}</td>
            </tr>
            </tbody>
        </table>

        <form:hidden path="corporate_name" value="${bpInform.getCorporate_name()}"/>
        <form:hidden path="bp_type" value="${bpInform.getBp_type()}"/>
        <form:hidden path="corporate_type1" value="${bpInform.getCorporate_type1()}"/>
        <form:hidden path="contract_dept" value="${bpInform.getContract_dept()}"/>
        <form:hidden path="contract_manager" value="${bpInform.getContract_manager()}"/>
        <form:hidden path="contract_tel" value="${bpInform.getContract_tel()}"/>
        <form:hidden path="contract_mail" value="${bpInform.getContract_mail()}"/>
        <form:hidden path="userid" value="${login.getUserid()}"/>

        <%--Regist Buttons--%>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button class="btn btn-secondary me-md-2" style="font-weight:bold;" type="button"
                    onclick="history.back()">&nbsp;&nbsp;戻る&nbsp;&nbsp;
            </button>
            <button class="btn btn-dark" type="submit" style="font-weight:bold;">
                &nbsp;&nbsp;登録&nbsp;&nbsp;
            </button>
        </div>
        <%--/Regist Buttons--%>
    </form:form>
    <%--/Regist Form--%>

</main>
</div>
<%--/Main Contents--%>


<%@ include file="../coverBottom.jsp" %>

</html>