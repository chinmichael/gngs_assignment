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
                                        value="${bpInform.getCorporate_name()}" readonly="true"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;派遣元事業所
                    </th>
                    <td>
                        <div class="col-sm-5">
                            <form:hidden path="dispatch_code" value="1"></form:hidden>
                            <form:input path="dispatch_name" cssClass="form-control form-control-sm"
                                        value="株式会社ジエンジサービス" readonly="true"/>
                            <form:errors path="dispatch_name" style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;36協定パターン名
                    </th>
                    <td>
                        <div class="col-sm-auto">
                            <form:hidden path="pattern" value="02"></form:hidden>
                            <form:input path="pattern_name" cssClass="form-control form-control-sm"/>
                            <form:errors path="pattern_name" style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>

                <!--overtime-->
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;36協定_1日
                    </th>
                    <td>
                        <div class="col-sm-3">
                            <form:input path="overtime_day" cssClass="form-control form-control-sm"
                                        value="${agreementInform.getOvertime_day()}"/>
                            <form:errors path="overtime_day" style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;36協定_1箇月
                    </th>
                    <td>
                        <div class="col-sm-3">
                            <form:input path="overtime_month" cssClass="form-control form-control-sm"
                                        value="${agreementInform.getOvertime_month()}"/>
                            <form:errors path="overtime_month" style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;36協定_3箇月
                    </th>
                    <td>
                        <div class="col-sm-3">
                            <form:input path="overtime_quarter" cssClass="form-control form-control-sm"
                                        value="${agreementInform.getOvertime_quarter()}"/>
                            <form:errors path="overtime_quarter" style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;36協定_6箇月
                    </th>
                    <td>
                        <div class="col-sm-3">
                            <form:input path="overtime_half" cssClass="form-control form-control-sm"
                                        value="${agreementInform.getOvertime_half()}"/>
                            <form:errors path="overtime_half" style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;36協定_1年
                    </th>
                    <td>
                        <div class="col-sm-3">
                            <form:input path="overtime_year" cssClass="form-control form-control-sm"
                                        value="${agreementInform.getOvertime_year()}"/>
                            <form:errors path="overtime_year" style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;休日労働
                    </th>
                    <td>
                        <div class="col-sm-2">
                            <div class="input-group input-group-sm">
                                <form:input path="holiday_work" cssClass="form-control form-control-sm"
                                            value="${agreementInform.getHoliday_work()}"/>
                                <div class="input-group-text">回／月</div>
                                <form:errors path="holiday_work"
                                             style="font-size: 10pt;color: red; padding-left: 5px;"/>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;"
                        valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;法定休日
                    </th>
                    <td>
                        <div class="col-sm-2">
                            <input type="hidden" id="holidayWork" value="${agreementInform.getHoliday_dayweek()}"/>
                            <form:select path="holiday_dayweek" cssClass="form-select form-select-sm">
                                <option value="0">日曜日</option>
                                <option value="1">月曜日</option>
                                <option value="2">火曜日</option>
                                <option value="3">水曜日</option>
                                <option value="4">木曜日</option>
                                <option value="5">金曜日</option>
                                <option value="6">土曜日</option>
                            </form:select>
                            <form:errors path="holiday_dayweek"
                                         style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;"
                        valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;起算月
                    </th>
                    <td>
                        <div class="col-sm-2">
                            <input type="hidden" id="checkMonth" value="${agreementInform.getCheck_month()}"/>
                            <form:select path="check_month" cssClass="form-select form-select-sm">
                            </form:select>
                            <input type="hidden" id="checkMonth" value="${agreementInform.getCheck_month()}"/>
                            <form:errors path="check_month"
                                         style="font-size: 10pt;color: red; padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>



                <!--extend time-->
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