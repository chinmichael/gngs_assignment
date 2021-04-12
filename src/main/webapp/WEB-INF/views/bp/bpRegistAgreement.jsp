<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<!--Top-->
<%@ include file="bpRegistTop.jsp"%>
<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="breadcrumb" style="margin-left: 20px;">
    <li class="nav-item">
        <a class="nav-link" data-bs-toggle="modal" data-bs-target="#registMoveModal" href="#"
           onclick="registMove('基本情報登録', 'bpRegist')"
        >基本情報登録&nbsp;&nbsp;></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-bs-toggle="modal" data-bs-target="#registMoveModal" href="#"
           onclick="registMove('口座情報登録', 'bpRegistAccount')"
        >口座情報登録&nbsp;&nbsp;></a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="#"
        >36協定情報登録&nbsp;&nbsp;></a>
    </li>
    <li class="nav-item">
        <a class="nav-link disabled" href="#"
        >確認・登録</a>
    </li>
</ul>
<%@ include file="../modal/registMoveModal.jsp"%>
</div>
</div>
</nav>
<div style="min-height: 7px; background-color: #0c63e4"></div>
<!--LogModal-->
<!--/LogModal-->
<!--/Top-->
<div class="container-fluid">
    <div class="row flex-column flex-xl-row" style="font-family: Meiryo; margin-bottom: 150px; padding-left: 50px; padding-right: 50px;">

        <!--Main-->
        <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;
            text-align:center; margin-bottom: 30px; margin-top: 40px;">
            36協定情報登録</h3>

        <%--Regist Form--%>
        <form:form modelAttribute="agreementVO" action="bpRegistAgreementSend" method="post" name="bpRegistAgreementFrm">
            <form:hidden path="bp_id" value="${bpInform.getBp_id()}"/>
            <table class="table table-bordered border-secondary"
                   style="max-width: 900px; margin-left: auto; margin-right: auto;">
                <thead>
                <tr>
                    <th colspan="2" style="text-align: right; background-color: #F2F2F2;">
                        <span style="color: red;margin-right:5px;"><i class="fas fa-caret-right"></i> : 入力必須項目です</span>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;取引先
                    </th>
                    <td>
                        <div class="col-sm-3">
                            <form:input path="corporate_name" cssClass="form-control form-control-sm"
                                        value="${bpInform.getCorporate_num()}" readonly="true"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;派遣元事業所
                    </th>
                    <td>
                        <div class="col-sm-5">
                            <form:input path="dispatch_name" cssClass="form-control form-control-sm"
                                        value="株式会社ジエンジサービス"/>
                            <form:errors path="bank_name" style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>


                </tbody>
            </table>

            <%--Regist Buttons--%>
            <div style="max-width: 900px; margin: auto;">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-secondary me-md-2" style="font-weight:bold;" type="button"
                            onclick="history.back()">&nbsp;&nbsp;戻る&nbsp;&nbsp;
                    </button>
                    <button class="btn btn-dark" type="submit" style="font-weight:bold;">
                        &nbsp;&nbsp;次へ&nbsp;&nbsp;
                    </button>
                </div>
            </div>
            <%--/Regist Buttons--%>
        </form:form>
        <%--/Regist Form--%>
        <!--/Main-->

        <!--Button-->
        <!--/Button-->
    </div>
    <!--Footer-->
    <%@ include file="bpRegistBottom.jsp"%>
    <script type="text/javascript" src="../../../resource/js/bp/bpRegistScript.js"></script>
    <!--/Footer-->
</html>