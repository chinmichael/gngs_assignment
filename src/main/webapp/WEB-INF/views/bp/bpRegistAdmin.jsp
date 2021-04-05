<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <%@ include file="../coverTop.jsp" %>
<div>
    <%@ include file="bpSideNav.jsp" %>

    <%--Main Contents--%>
    <main class="col bg-faded py-4 flex-grow-1" style="font-family: Meiryo; margin-bottom: 150px; padding-left: 30px; padding-right: 25px;">

        <a href=# data-bs-toggle="modal" data-bs-target="#logMoveModal" style="text-decoration:none;"
           onclick="logMove('BP情報一覧', 'bpList')">BP情報一覧 ></a>
        <a style="text-decoration:none;">BP情報登録依頼 ></a>
        <a style="text-decoration:none;">BP情報登録依頼確認 ></a>
        <a style="text-decoration:none;">BP詳細情報登録</a>

        <%@ include file="../logMoveModal.jsp"%>

        <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px; margin-top:20px;">
            BP詳細情報登録</h3>

        <%--Regist Form--%>
        <form:form modelAttribute="bpInformDetailVO" action="bpRegistAdminSend" method="post" name="bpRequestFrm" onsubmit="return check(this)">

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
                        <div class="col-sm-5">
                            <form:input path="bp_id" cssClass="form-control form-control-sm"
                                        cssStyle="text-align: center" value="${bpInform.getBp_id()}" readonly="true"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;BP区分</th>
                    <td>
                        <div class="row g-0">
                            <div class="col-sm-auto">
                                <form:select path="bp_type" id="bp_type" cssClass="form-select form-select-sm">
                                    <option value="0">顧客</option>
                                    <option value="1">パートナー</option>
                                </form:select>
                                <input type="hidden" id="bpType" value="${bpInform.getBp_type()}">
                            </div>
                        </div>
                    </td>
                </tr>

                <!--Corporate Information-->
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;会社(氏)名</th>
                    <td><form:input path="corporate_name" cssClass="form-control form-control-sm" value="${bpInform.getCorporate_name()}"/>
                        <form:errors path="corporate_name" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;会社(氏)名(カナ)</th>
                    <td><form:input path="corporate_name_kana" cssClass="form-control form-control-sm" value="${bpInform.getCorporate_name_kana()}"/>
                        <form:errors path="corporate_name_kana" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;会社(氏)名(英文)</th>
                    <td><form:input path="corporate_name_eng" cssClass="form-control form-control-sm" value="${bpInform.getCorporate_name_eng()}"/>
                        <form:errors path="corporate_name_eng" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;企業区分</th>
                    <td>
                        <div class="row g-0">
                            <div class="col-sm-auto">
                                <form:select path="corporate_type1" cssClass="form-select form-select-sm"
                                             onchange="changeCompType(this)">
                                    <option value="0" selected>法人</option>
                                    <option value="1">自営業</option>
                                    <option value="2">その他</option>
                                </form:select>
                                <input type="hidden" id="compType1" value="${bpInform.getCorporate_type1()}"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;詳細区分</th>
                    <td>
                        <div class="row g-0">
                            <div class="col-sm-auto">
                                <form:select path="corporate_type2" cssClass="form-select form-select-sm">
                                    <c:choose>
                                        <c:when test="${bpInform.getCorporate_type1() == '0' }">
                                            <option value="0">零細</option>
                                            <option value="1">中小</option>
                                            <option value="2">大手</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="3">男</option>
                                            <option value="4">女</option>
                                        </c:otherwise>
                                    </c:choose>
                                </form:select>
                                <input type="hidden" id="compType2" value="${bpInform.getCorporate_type2()}">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;創立日</th>
                    <td>
                        <div class="row g-0">
                            <div class="col-sm-auto">
                                <input type="date" name="corporateBirth" id="corporateBirth" value="${bpInform.getCorporate_birth()}"/>
                                <form:hidden path="corporate_birth" id="corporate_birth" />
                                <form:errors path="check_corporate_birth" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                                <form:errors path="corporate_birth" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;郵便番号</th>
                    <td>
                        <div class="col-sm-3">
                            <div class="input-group input-group-sm">
                                <div class="input-group-text">〒</div>
                                <form:input path="corporate_zipcode" cssClass="form-control form-control-sm" maxlength="7" id="zipcode" onchange="searchAddress();"/>
                            </div>
                            <form:errors path="corporate_zipcode" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;住所</th>
                    <td><form:input path="corporate_address1" cssClass="form-control form-control-sm" readonly="true" id="address1"/>
                        <form:input path="corporate_address2" cssClass="form-control form-control-sm" style="margin-top:10px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;電話番号</th>
                    <td>
                        <div class="row g-2">
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="3" path="corporateTel1" id="corporateTel1" value="${bpInform.getCorporateTel1()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="corporateTel2" id="corporateTel2" value="${bpInform.getCorporateTel2()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="corporateTel3" id="corporateTel3" value="${bpInform.getCorporateTel3()}"/>
                            </div>
                        </div>
                        <form:hidden path="corporate_tel" id="corporateTel"/>
                        <form:errors path="corporate_tel" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        &nbsp;&nbsp;FAX番号</th>
                    <td>
                        <div class="row g-2">
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="3" path="corporateFax1" id="corporateFax1" value="${bpInform.getCorporateFax1()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="corporateFax2" id="corporateFax2" value="${bpInform.getCorporateFax2()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="corporateFax3" id="corporateFax3" value="${bpInform.getCorporateFax3()}"/>
                            </div>
                        </div>
                        <form:hidden path="corporate_fax" id="corporateFax"/>
                        <form:errors path="corporate_fax" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        &nbsp;&nbsp;ホームページ URL</th>
                    <td><form:input path="corporate_homepage" cssClass="form-control form-control-sm"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        &nbsp;&nbsp;代表者名</th>
                    <td>
                        <div class="col-sm-5">
                            <form:input path="corporate_applier" cssClass="form-control form-control-sm"/>
                        </div>
                    </td>
                </tr>
                <!--/Corporate Information-->

                <!--Department Information-->
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
                                <form:input class="form-control form-control-sm" maxlength="3" path="contractTel1" id="contractTel1" value="${bpInform.getContractTel1()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="contractTel2" id="contractTel2" value="${bpInform.getContractTel2()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="contractTel3" id="contractTel3" value="${bpInform.getContractTel3()}"/>
                            </div>
                        </div>
                        <form:hidden path="contract_tel" id="contractTel"/>
                        <form:errors path="contract_tel" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        &nbsp;&nbsp;契約担当携帯番号</th>
                    <td>
                        <div class="row g-2">
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="3" path="contractPhone1" id="contractPhone1" value="${bpInform.getContractPhone1()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="contractPhone2" id="contractPhone2" value="${bpInform.getContractPhone2()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="contractPhone3" id="contractPhone3" value="${bpInform.getContractPhone3()}"/>
                            </div>
                        </div>
                        <form:hidden path="contract_phone" id="contractPhone"/>
                        <form:errors path="contract_phone" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;契約担当メール</th>
                    <td>
                        <form:input path="contract_mail" cssClass="form-control form-control-sm"
                                    value="${bpInform.getContract_mail()}"/>
                        <form:errors path="contract_mail" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <!--/Department Information-->

                <!--Dispatch Information-->
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;派遣元部署名</th>
                    <td><form:input path="dispatch_dept" cssClass="form-control form-control-sm"/>
                        <form:errors path="dispatch_dept" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;派遣元役職名</th>
                    <td>
                        <div class="col-sm-5">
                            <form:input path="dispatch_admin" cssClass="form-control form-control-sm"/>
                            <form:errors path="dispatch_admin" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;派遣元担当者名</th>
                    <td>
                        <div class="col-sm-5">
                            <form:input path="dispatch_manager" cssClass="form-control form-control-sm"/>
                            <form:errors path="dispatch_manager" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;派遣元電話番号</th>
                    <td>
                        <div class="row g-2">
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="3" path="dispatchTel1" id="dispatchTel1" value="${bpInform.getDispatchTel1()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="dispatchTel2" id="dispatchTel2" value="${bpInform.getDispatchTel2()}"/>
                            </div><div class="col-sm-auto" style="padding-top: 4px;" align="center">-</div>
                            <div class="col-sm-3">
                                <form:input class="form-control form-control-sm" maxlength="4" path="dispatchTel3" id="dispatchTel3" value="${bpInform.getDispatchTel3()}"/>
                            </div>
                        </div>
                        <form:hidden path="dispatch_tel" id="dispatchTel"/>
                        <form:errors path="dispatch_tel" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;派遣元メール</th>
                    <td>
                        <form:input path="dispatch_mail" cssClass="form-control form-control-sm"
                                    value="${bpInform.getDispatch_mail()}"/>
                        <form:errors path="dispatch_mail" style="font-size: 10pt;color: red;padding-left: 5px;"/>
                    </td>
                </tr>
                <!--/Dispatch Information-->

                <!--Process Information-->
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;手続き状況</th>
                    <td>
                        <div class="row g-0">
                            <div class="col-sm-auto">
                                <form:select path="procedure_status" id="procedure_status" cssClass="form-select form-select-sm">
                                    <option value="0">登録依頼</option>
                                    <option value="1">審査待ち</option>
                                    <option value="2">完了</option>
                                </form:select>
                                <input type="hidden" id="procedureStatus" value="${bpInform.getProcedure_status()}">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;取引状況</th>
                    <td>
                        <div class="row g-0">
                            <div class="col-sm-auto">
                                <form:select path="deal_status" id="deal_status" cssClass="form-select form-select-sm">
                                    <option value="0">取引前</option>
                                    <option value="1">取引中</option>
                                    <option value="2">取引停止</option>
                                </form:select>
                                <input type="hidden" id="dealStatus" value="${bpInform.getDeal_status()}">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        <span style="color: red"><i class="fas fa-caret-right"></i></span>&nbsp;登録者</th>
                    <td>
                        <div class="col-sm-5">
                            <input class="form-control form-control-sm" type="text" style="text-align: center"
                                   id="userName" readonly="true" value="${login.getUsername()}">
                        </div>
                    </td>
                </tr>
                <!--/Process Information-->

                <!--Account, Agreement Regist Form Button + Extra-->
                <div class="modal fade" id="registMoveModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body" align="center" style="font-size: 11pt;font-weight: bold;">
                                このページの内容をセーブしますか。
                            </div>
                            <div align="center" style="color: #0d6efd; font-size: 50pt; margin-bottom: 5px;">
                                <i class="fas fa-cloud-upload-alt"></i>
                            </div>
                            <div>
                                <button type="button" class="btn btn-secondary btn-sm" id="noSaveMove"
                                        style="margin-left:20px; margin-bottom:15px;padding-top: 7px;">&nbsp;いいえ&nbsp;</button>
                                <button type="button" class="btn btn-primary btn-sm" id="saveMove"
                                        style="float:right; margin-right: 20px; margin-bottom: 15px;padding-top: 7px;">&nbsp;はい&nbsp;</button>
                            </div>
                        </div>
                    </div>
                </div>

                <tr>
                    <th colspan="2" style="width: 200px;font-size: 12pt; padding-left: 15px;text-align:center;" valign="middle">
                        <button class="btn btn-dark me-md-2" style="font-weight:bold; color: white;" type="button"
                                data-bs-toggle="modal" data-bs-target="#registMoveModal"
                                onclick="moveAccount()">&nbsp;&nbsp;口座情報情報登録&nbsp;&nbsp;</button>
                        <button class="btn btn-dark me-md-2" style="font-weight:bold; color: white;" type="button"
                                data-bs-toggle="modal" data-bs-target="#registMoveModal"
                                onclick="moveAgreement()">&nbsp;&nbsp;３６協定情報登録&nbsp;&nbsp;</button>
                    </th>
                </tr>
                <tr>
                    <th style="width: 200px;font-size: 12pt; padding-left: 15px; background-color: #F2F2F2;" valign="middle">
                        &nbsp;&nbsp;備考
                    </th>
                    <td>
                        <form:textarea path="note" cssClass="form-control form-control-sm" rows="3"/>
                    </td>
                </tr>
                <!--/Account, Agreement Regist Form Button + Extra-->
                </tbody>
            </table>

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
<script type="text/javascript"
        src="../../../resource/js/bp/bpModifyScript.js"></script>
<%--
<script src="//api.zipaddress.net/sdk/zipaddr.min.js" async></script>--%>

<%--<script type="text/javascript">
    var searchAddress = function () {
        var $zipcode = $('#zipcode');
        var zipcode = $zipcode.val();
        var $address = $('#address1');

        if(zipcode && zipcode.length === 7) {
            ZA.request(zipcode, function (data, err) {
               if(err) {
                   $address.val('');
                   //$zipcode.focus();
                   //return alert(data.message);
               }
               $address.val(data.fullAddress);
               //$address.focus();
            });
        } else {
            /!*alert("郵便番号に誤りがあります。");
            $zipcode.focus();*!/
            $address.val('');
        }
    };
</script>--%>

</html>