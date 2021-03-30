<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<%@ include file="../coverTop.jsp" %>

<%@ include file="bpSideNav.jsp" %>

<%--Main Contents--%>
<main class="col bg-faded py-4 flex-grow-1" style="font-family: Meiryo; margin-bottom: 150px; padding-left: 30px; padding-right: 25px;">

    <a href=# data-bs-toggle="modal" data-bs-target="#logMoveModal" style="text-decoration:none;"
       onclick="logMove('BP情報一覧', 'bpList')">BP情報一覧 ></a>
    <a href=# data-bs-toggle="modal" data-bs-target="#logMoveModal" style="text-decoration:none;"
       onclick="logMove('BP情報登録依頼', -1)">
        BP情報登録依頼 ></a>
    <a style="text-decoration:none;">BP情報登録確認</a>

    <%@ include file="../logMoveModal.jsp"%>

    <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px; margin-top:20px;">
        BP情報登録確認</h3>

    <%--Regist Form--%>
    <form:form modelAttribute="bpInformVO" action="../bp/bpRequestCheckSend" method="post" name="bpRequestCheckFrm">

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

        <div class="modal fade" id="bpRequestFormCheckModal" tabindex="-1" aria-labelledby="bpRequestFormCheckModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-body" align="center" style="font-size: 11pt;font-weight: bold;">
                        登録依頼メールをおくりましょうか。
                    </div>
                    <div align="center" style="color: cornflowerblue; font-size: 50pt; margin-bottom: 5px;">
                        <i class="fas fa-paper-plane"></i>
                    </div>
                    <div>
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal"
                                style="margin-left:20px; margin-bottom:15px;padding-top: 6px;"
                                onclick="goDetailRegist()">&nbsp;いいえ&nbsp;</button>
                        <button type="submit" class="btn btn-success btn-sm" id="moveAccept"
                                style="float:right; margin-right: 20px; margin-bottom: 15px;padding-top: 6px;">&nbsp;はい&nbsp;</button>
                    </div>
                </div>
            </div>
        </div>

        <%--Regist Buttons--%>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button class="btn btn-secondary me-md-2" style="font-weight:bold;" type="button"
                    onclick="history.back()">&nbsp;&nbsp;戻る&nbsp;&nbsp;
            </button>
            <button class="btn btn-dark" type="button" data-bs-toggle="modal" data-bs-target="#bpRequestFormCheckModal" style="font-weight:bold;">
                &nbsp;&nbsp;登録&nbsp;&nbsp;
            </button>
        </div>
        <%--/Regist Buttons--%>
    </form:form>
    <%--/Regist Form--%>

</main>
</div>
<%--/Main Contents--%>

<%--Search Script--%>
<%--/Search Script--%>


<%@ include file="../coverBottom.jsp" %>

<script type="text/javascript">
    function goDetailRegist() {
        document.bpRequestCheckFrm.action="../bp/bpGoRegistAdmin";
        document.bpRequestCheckFrm.submit();
    }
</script>

</html>