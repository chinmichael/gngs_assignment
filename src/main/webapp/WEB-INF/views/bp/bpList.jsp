<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <%@ include file="../coverTop.jsp"%>

    <%@ include file="bpSideNav.jsp"%>

    <%--Main Contents--%>
    <main class="col bg-faded py-4 flex-grow-1" style="font-family: Meiryo; margin-bottom: 150px; padding-left: 30px; padding-right: 25px;">

        <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px">
            BP情報一覧</h3>

        <table class="table table-bordered" style="font-size: 11pt;">
            <tr>
                <th style="width: 120px;background-color: #E6E6E6; text-align: center;" valign="middle">
                    &nbsp;検索条件</th>
                <td>
                    <form method="post" name="bpSearchFrm" action="../bp/bpSearch">
                        <div class="row g-2">
                            <div class="col-sm-auto">
                                <select class="form-select form-select-sm" id="searchType1" name="searchType1"
                                        onchange="changeSearchType2(this)">
                                    <option value="0" selected>区分なし</option>
                                    <option value="bp_type">BP区分</option>
                                    <option value="corporate_type1">企業区分</option>
                                    <option value="corporate_type2">詳細区分</option>
                                    <option value="procedure_status">手続き状況</option>
                                    <option value="deal_status">取引状況</option>
                                </select>
                            </div>
                            <div class="col-sm-auto">
                                <select class="form-select form-select-sm" id="searchType2" name="searchType2">
                                    <option value="0">区分なし</option>
                                </select>
                            </div>
                            <div class="col-sm-auto">
                                <input type="text" class="form-control form-control-sm" id="searchName"
                                       name="searchName" value="${searchName}" placeholder="会社(氏)名"/>
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

            <table class="table table-bordered table-hover" style="font-size: 10pt;">
                <thead class="table-secondary" style="vertical-align: middle; text-align: center;">
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">会社(氏)名</th>
                    <th scope="col">BP区分</th>
                    <th scope="col">企業区分</th>
                    <th scope="col">詳細区分</th>
                    <th scope="col">所在地</th>
                    <th scope="col">手続き状況</th>
                    <th scope="col">処理日</th>
                    <th scope="col">取引状況</th>
                    <th scope="col">処理日</th>
                </tr>
                </thead>

                <tbody style="vertical-align: middle; text-align: center;">
                <c:forEach var="pagingList" items="${pagingList}">
                    <tr>
                        <th scope="row" style="color: gray">${pagingList.getRnum()}</th>
                        <td><a href="../bp/bpModify?key=${pagingList.getUuid()}">
                                ${pagingList.getCorporate_name()}</a></td>
                        <td>
                            <c:choose>
                                <c:when test="${pagingList.getBp_type() == '0'}">
                                    顧客
                                </c:when>
                                <c:otherwise>
                                    パートナー
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${pagingList.getCorporate_type1() == '0'}">
                                    法人
                                </c:when>
                                <c:when test="${pagingList.getCorporate_type1() == '1'}">
                                    自営業
                                </c:when>
                                <c:otherwise>
                                    その他
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${pagingList.getCorporate_type2() == '0'}">
                                    零細
                                </c:when>
                                <c:when test="${pagingList.getCorporate_type2() == '1'}">
                                    中小
                                </c:when>
                                <c:when test="${pagingList.getCorporate_type2() == '2'}">
                                    大手
                                </c:when>
                                <c:when test="${pagingList.getCorporate_type2() == '3'}">
                                    男
                                </c:when>
                                <c:when test="${pagingList.getCorporate_type2() == '4'}">
                                    女
                                </c:when>
                            </c:choose>
                        </td>
                        <td>ready...</td>
                        <td>
                            <c:choose>
                                <c:when test="${pagingList.getProcedure_status() == '0'}">
                                    登録依頼
                                </c:when>
                                <c:when test="${pagingList.getProcedure_status() == '1'}">
                                    審査待ち
                                </c:when>
                                <c:otherwise>
                                    完了
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${pagingList.getProcedure_pass_date()}</td>
                        <td>
                            <c:choose>
                                <c:when test="${pagingList.getDeal_status() == '0'}">
                                    取引前
                                </c:when>
                                <c:when test="${pagingList.getDeal_status() == '1'}">
                                    取引中
                                </c:when>
                                <c:otherwise>
                                    取引停止
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${pagingList.getDeal_pass_date()}</td>
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
                                   end="${resMap.endPage > resMap.totalPage ? resMap.totalPage : resMap.endPage}"
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

                        <c:if test="${resMap.nextPage <= resMap.totalPage}">
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
                <a href="../bp/bpRequestForm" style="text-decoration: none; color: white;">新規登録</a>
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
        <input type="hidden" name="searchName" value="${searchName}">
        <input type="hidden" name="searchType1" value="${searchType1}">
        <input type="hidden" name="searchType2" value="${searchType2}">
    </form>
    <%--/Search Hidden Form--%>


    <%@ include file="../coverBottom.jsp"%>

    <script type="text/javascript"
            src="../../../resource/js/bp/bpListScript.js"></script>
</html>