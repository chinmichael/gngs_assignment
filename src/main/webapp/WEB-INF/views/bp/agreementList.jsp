<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%@ include file="../coverTop.jsp"%>

<%@ include file="bpSideNav.jsp"%>

<%--Main Contents--%>
<main class="col bg-faded py-4 flex-grow-1" style="font-family: Meiryo; margin-bottom: 150px; padding-left: 30px; padding-right: 25px;">

    <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px">
        36協定情報一覧</h3>

    <table class="table table-bordered" style="font-size: 11pt;">
        <tr>
            <th style="width: 120px;background-color: #E6E6E6; text-align: center;" valign="middle">
                &nbsp;検索条件</th>
            <td>
                <form method="post" name="bpSearchFrm" action="../bp/bpSearch">
                    <div class="row g-2">
                        <div class="col-sm-auto">
                            <select class="form-select form-select-sm" id="search_dispatch" name="search_dispatch">
                                <option value="0" selected>派遣元事業所選択</option>
                                <option value="1">株式会社ジエンジサービス</option>
                            </select>
                        </div>
                        <div class="col-sm-auto">
                            <input type="text" class="form-control form-control-sm" id="search_pattern_code"
                                   name="search_pattern_code" value="${search_pattern_code}"
                                   placeholder="36協定パターンコード"/>
                        </div>
                        <div class="col-sm-auto">
                            <input type="text" class="form-control form-control-sm" id="search_pattern_name"
                                   name="search_pattern_name" value="${search_pattern_name}"
                                   placeholder="36協定パターン名"/>
                        </div>
                        <div class="col-sm-auto">
                            <button type="submit" class="btn btn-secondary btn-sm"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>
            </td>
        </tr>
    </table>

    <div id="printTableArea">
        <table class="table table-hover table-bordered" style="font-size: 9pt;">
            <thead class="table-secondary" style="vertical-align: middle; text-align: center;">
            <tr>
                <th rowspan="2" scope="col">コマンド</th>
                <th rowspan="2" scope="col">取引先コード</th>
                <th rowspan="2" scope="col">派遣元事業所<br/>コード</th>
                <th colspan="8" scope="col">３６協定</th>
                <th rowspan="2" scope="col">起算<br/>月日</th>
                <th rowspan="2" scope="col">協定期間</th>
            </tr>
            <tr>
                <th scope="col">パターン<br/>コード</th>
                <th scope="col">パターン名</th>
                <th scope="col">１日<br/>(hr)</th>
                <th scope="col">１箇月<br/>(hr)</th>
                <th scope="col">３箇月<br/>(hr)</th>
                <th scope="col">６箇月<br/>(hr)</th>
                <th scope="col">１年<br/>(hr)</th>
                <th scope="col">休日労働<br/>(回/月)</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="pagingList" items="${pagingList}">
                <tr>
                    <th>
                        <c:choose>
                            <c:when test="">
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button class="btn btn-dark" type="button" style="font-weight:bold;">
                                        <a href=# style="text-decoration: none; color: white;">更新</a>
                                    </button>
                                    <button class="btn btn-dark" type="button" style="font-weight:bold;">
                                        <a href=# style="text-decoration: none; color: white;">削除</a>
                                    </button>
                                </div>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>
                    </th>
                    <td>${pagingList.getBp_id()}<br/>${pagingList.getCoporate_name()}</td>
                    <td>${pagingList.getDispatch_code()}<br/>${pagingList.getDispatch_name()}</td>
                    <td>${pagingList.getPattern()}</td>
                    <td>${pagingList.getPattern_name()}</td>
                    <td>${pagingList.getOvertime_day()}</td>
                    <td>${pagingList.getOvertime_month()}</td>
                    <td>${pagingList.getOvertime_quarter()}</td>
                    <td>${pagingList.getOvertime_half()}</td>
                    <td>${pagingList.getOvertime_year()}</td>
                    <td>${pagingList.getHoliday_work()}</td>
                    <td>${pagingList.getCheck_month()}/${pagingList.getCheck_date()}</td>
                    <td>${pagingList.getStart_date()}~<br/>${pagingList.getEnd_date()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <%--Paging--%>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">

            <c:choose>
                <%--Non-Search--%>
                <c:when test="${empty searchType1}">
                    <c:if test="${resMap.pageGroup > 1}">
                        <li class="page-item">
                            <a class="page-link" aria-label="Previous"
                               style="font-weight:bold;box-shadow: none; border: none; background-color: #edf5fb;"
                               href="javascript:fnGoPaging(<c:out value='${resMap.prePage}'/>)">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach var="i"
                               begin="${resMap.startPage}"
                               end="${resMap.endPage > resMap.total ? resMap.total : resMap.endPage}"
                               varStatus="status">
                        <c:choose>
                            <c:when test="${resMap.page eq i}">
                                <li class="page-item">
                                    <a class="page-link"
                                       style="font-weight: bolder;box-shadow: none;border: none;background-color: #edf5fb;"
                                       href="javascript:fnGoPaging(${i});">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" style="box-shadow: none; border: none; background-color: #edf5fb;"
                                       href="javascript:fnGoPaging(${i});">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${resMap.nextPage <= resMap.total}">
                        <li class="page-item">
                            <a class="page-link" aria-label="Next" style="font-weight:bold;box-shadow: none; border: none; background-color: #edf5fb;"
                               href="javascript:fnGoPaging(<c:out value='${resMap.nextPage}'/>)">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </c:when>

                <%--Search--%>
                <c:otherwise>
                    <c:if test="${resMap.pageGroup > 1}">
                        <li class="page-item">
                            <a class="page-link" aria-label="Previous"
                               style="font-weight:bold;box-shadow: none; border: none; background-color: #edf5fb;"
                               href="javascript:fnGoSearchPaging(<c:out value='${resMap.prePage}'/>)">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach var="i"
                               begin="${resMap.startPage}"
                               end="${resMap.endPage > resMap.total ? resMap.total : resMap.endPage}"
                               varStatus="status">
                        <c:choose>
                            <c:when test="${resMap.page eq i}">
                                <li class="page-item">
                                    <a class="page-link"
                                       style="font-weight: bolder;box-shadow: none;border: none;background-color: #edf5fb;"
                                       href="javascript:fnGoSearchPaging(${i});">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" style="box-shadow: none; border: none; background-color: #edf5fb;"
                                       href="javascript:fnGoSearchPaging(${i});">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${resMap.nextPage <= resMap.total}">
                        <li class="page-item">
                            <a class="page-link" aria-label="Next" style="font-weight:bold;box-shadow: none; border: none; background-color: #edf5fb;"
                               href="javascript:fnGoSearchPaging(<c:out value='${resMap.nextPage}'/>)">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>

    <%--/Paging--%>

    <%--Regist Buttons--%>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <button class="btn btn-dark" type="button" style="font-weight:bold;">
            <a href=# style="text-decoration: none; color: white;">新規入力</a>
        </button>

        <button class="btn btn-secondary" type="button" style="font-weight:bold;" onclick="pageTablePrint()">
            <a href=# style="text-decoration: none; color: white;">印刷</a>
        </button>

        <button class="btn btn-danger" type="button" style="font-weight:bold;">
            <a href=# style="text-decoration: none; color: white;">閉じる</a>
        </button>
    </div>
    <%--/Regist Buttons--%>

</main>
</div>
<%--/Main Contents--%>

<%--Search Hidden Form--%>
<form name="searchMove" action="../bp/bpSearch" method="post">
    <input type="hidden" name="page">
    <input type="hidden" name="search_dispatch" value="${search_dispatch}">
    <input type="hidden" name="search_pattern_code" value="${search_pattern_code}">
    <input type="hidden" name="search_pattern_name" value="${search_pattern_name}">
</form>
<%--/Search Hidden Form--%>


<%@ include file="../coverBottom.jsp"%>

<script type="text/javascript" src="../../../resource/js/bp/agreementListScript.js"></script>
</html>