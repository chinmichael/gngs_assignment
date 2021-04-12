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

    <a href=# data-bs-toggle="modal" data-bs-target="#logMoveModal" style="text-decoration:none;"
        onclick="logMove('BP情報一覧', 'bpList')">BP情報一覧 ></a>
    <a style="text-decoration:none;">BP情報登録依頼</a>

    <%@ include file="../modal/logMoveModal.jsp"%>

    <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px; margin-top:20px;">
        BP情報登録依頼</h3>

    <%--Regist Form--%>
    <form:form modelAttribute="bpInformVO" action="../bp/bpRequestSend" method="post" name="bpRequestFrm" onsubmit="return check(this)">

    <table class="table table-bordered border-secondary" style="max-width: 900px;">
        <thead>
            <tr><th colspan="2" style="text-align: right; background-color: #F2F2F2;">
                <span style="color: red;margin-right:5px;"><i class="fas fa-caret-right"></i> : 入力必須項目です</span>
            </th></tr>
        </thead>
        <tbody>
        <tr>
            <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;会社(氏)名</th>
            <td><form:input path="corporate_name" cssClass="form-control form-control-sm"/>
                <form:errors path="corporate_name" style="font-size: 10pt;color: red;padding-left: 5px;"/>
            </td>
        </tr>
        <tr>
            <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;BP区分</th>
            <td>
                <div class="row g-0">
                    <div class="col-sm-auto">
                        <form:select path="bp_type" id="bp_type" cssClass="form-select form-select-sm">
                            <option value="0" selected>顧客</option>
                            <option value="1">パートナー</option>
                        </form:select>
                        <input type="hidden" id="bpType" value="${bpType}">
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;企業区分</th>
            <td>
                <div class="row g-0">
                    <div class="col-sm-auto">
                        <form:select path="corporate_type1" id="corporate_type1" cssClass="form-select form-select-sm">
                            <option value="0" selected>法人</option>
                            <option value="1">自営業</option>
                            <option value="2">その他</option>
                        </form:select>
                        <input type="hidden" id="compType" value="${compType}"/>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                &nbsp;&nbsp;契約担当部署名</th>
            <td><form:input path="contract_dept" cssClass="form-control form-control-sm"/>
            </td>
        </tr>
        <tr>
            <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                &nbsp;&nbsp;契約担当者名</th>
            <td>
                <div class="col-sm-5">
                    <form:input path="contract_manager" cssClass="form-control form-control-sm"/>
                </div>
            </td>
        </tr>
        <tr>
            <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;契約担当電話番号</th>
            <td>
                <div class="row g-2">
                    <div class="col-sm-3">
                        <form:input class="form-control form-control-sm" maxlength="3" path="contractTel1" id="contractTel1"/>
                    </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                    <div class="col-sm-3">
                        <form:input class="form-control form-control-sm" maxlength="4" path="contractTel2" id="contractTel2"/>
                    </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                    <div class="col-sm-3">
                        <form:input class="form-control form-control-sm" maxlength="4" path="contractTel3" id="contractTel3"/>
                    </div>
                </div>
                <form:hidden path="contract_tel" id="contractTel"/>
                <form:errors path="contract_tel" style="font-size: 10pt;color: red;padding-left: 5px;"/>
            </td>
        </tr>
        <tr>
            <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;契約担当メール</th>
            <td>
                <%--<div class="row g-3">
                    <div class="col-sm-5">
                        <form:input cssClass="form-control form-control-sm" path="mailAddress1" id="mailAddress1"/>
                    </div>
                    <div class="col-sm-5">
                        <div class="input-group input-group-sm">
                            <div class="input-group-text">@</div>
                            <form:input cssClass="form-control form-control-sm" path="mailAddress2" id="mailAddress2"/>
                        </div>
                    </div>
                    <div class="col-sm-auto">
                        <select class="form-select form-select-sm" id="mailSelect">
                            <option value="0" selected>直接入力</option>
                            <option value="1">google.com</option>
                            <option value="2">yahoo.co.jp</option>
                            <option value="3">naver.com</option>
                        </select>
                    </div>
                </div>
                <form:hidden path="contract_mail" id="contractMail"/>--%>
                <form:input path="contract_mail" cssClass="form-control form-control-sm"/>
                <form:errors path="contract_mail" style="font-size: 10pt;color: red;padding-left: 5px;"/>
            </td>
        </tr>
        </tbody>
    </table>

    <%--Regist Buttons--%>
        <div style="max-width: 900px;">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button class="btn btn-secondary me-md-2" style="font-weight:bold;" type="button"
                        onclick="history.back()">&nbsp;&nbsp;戻る&nbsp;&nbsp;
                </button>
                <button class="btn btn-dark" type="submit" style="font-weight:bold;">
                    &nbsp;&nbsp;登録&nbsp;&nbsp;
                </button>
            </div>
        </div>
    <%--/Regist Buttons--%>
    </form:form>
    <%--/Regist Form--%>

</main>
</div>
<%--/Main Contents--%>

<%--Search Hidden Form--%>
<%--/Search Hidden Form--%>

<%--Search Script--%>
<%--/Search Script--%>

<%--Paging Script--%>
<%--/Paging Script--%>

<%@ include file="../coverBottom.jsp" %>

<script type="text/javascript">
    /*$("#mailSelect").change(function() {
        $("#mailSelect option:selected").each(function () {
            if($(this).val() == '0') {
                //$("#mailAddress2").val('');
                $("#mailAddress2").attr("disabled",false);
            } else {
                $("#mailAddress2").val($(this).text());
                $("#mailAddress2").attr("disabled",true);
            }
        });
    });*/

    function check(frm) {
        var tel = $("#contractTel1").val() + "-" + $("#contractTel2").val() + "-" + $("#contractTel3").val();
        //var mail = $("#mailAddress1").val() + "@" + $("#mailAddress2").val();

        $("#contractTel").val(tel);
        //$("#contractMail").val(mail);
    }

    $(document).ready(function(){
        var bpType = $("#bpType").val();
        var compType = $("#compType").val();
        if(bpType != "" && compType != "") {
            $("#bp_type").val(bpType).attr("selected", "true");
            $("#corporate_type1").val(compType).attr("selected", "true");
        }
    });

</script>

</html>