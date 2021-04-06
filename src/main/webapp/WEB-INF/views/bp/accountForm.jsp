<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<%@ include file="../coverTop.jsp" %>

<%@ include file="bpSideNav.jsp" %>

<%--Main Contents--%>
<main class="col bg-faded py-4 flex-grow-1" style="font-family: Meiryo; margin-bottom: 150px; padding-left: 30px; padding-right: 25px;">

    <c:choose>
        <c:when test="${empty moveKey && empty accountInform}">
            <a href=# data-bs-toggle="modal" data-bs-target="#logMoveModal" style="text-decoration:none;"
               onclick="logMove('口座情報一覧', 'accountList')">口座情報一覧 ></a>
            <a style="text-decoration:none;">口座情報登録</a>
        </c:when>
        <c:otherwise>

        </c:otherwise>
    </c:choose>


    <%@ include file="../logMoveModal.jsp"%>

    <c:choose>
        <c:when test="${empty accountInform}">
            <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px; margin-top:20px;">
                口座情報登録</h3>
        </c:when>
        <c:otherwise>
            <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px; margin-top:20px;">
                口座情報修正</h3>
        </c:otherwise>
    </c:choose>

    <%--Regist Form--%>
    <form:form modelAttribute="accountVO" action="accountSend" method="post" name="accountFrm" onsubmit="return check()">

        <table class="table table-bordered border-secondary">
            <thead>
            <tr><th colspan="2" style="text-align: right; background-color: #F2F2F2;">
                <span style="color: red;margin-right:5px;"><i class="fas fa-caret-right"></i> : 入力必須項目です</span>
            </th></tr>
            </thead>
            <tbody>
            <tr>
                <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                    <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;BPコード</th>
                <td>
                    <div class="row g-2">
                        <div class="col-sm-5">
                            <form:input path="bp_id" cssClass="form-control form-control-sm"
                                        id="setModalBpCode"
                                        cssStyle="text-align: center" value="${accountInform.getBp_id()}" readonly="true"/>
                        </div>
                        <c:if test="${empty accountInform}">
                            <div class="col-sm-auto">
                                <button type="button" class="btn btn-secondary btn-sm"
                                        data-bs-toggle="modal" data-bs-target="#bpCodeFindModal"
                                        onclick=""><i class="fas fa-search"></i></button>
                            </div>
                            <%@ include file="../bpCodeFindModal.jsp"%>
                        </c:if>
                    </div>
                </td>
            </tr>

            </tbody>
        </table>

        <%--Regist Buttons--%>
        <input type="hidden" id="moveKey" name="moveKey" value="1">

        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button class="btn btn-secondary me-md-2" style="font-weight:bold;" type="button"
                    onclick="history.back()">&nbsp;&nbsp;戻る&nbsp;&nbsp;
            </button>
            <c:choose>
                <c:when test="${empty accountInform}">
                    <button class="btn btn-dark" type="submit" style="font-weight:bold;">
                        &nbsp;&nbsp;登録&nbsp;&nbsp;
                    </button>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-dark" type="submit" style="font-weight:bold;">
                        &nbsp;&nbsp;変更&nbsp;&nbsp;
                    </button>
                </c:otherwise>
            </c:choose>
        </div>
        <%--/Regist Buttons--%>
    </form:form>
    <%--/Regist Form--%>

</main>
</div>
<%--/Main Contents--%>


<%@ include file="../coverBottom.jsp" %>

<script type="text/javascript" src="../../../resource/js/bp/accountFormScript.js"></script>


</html>