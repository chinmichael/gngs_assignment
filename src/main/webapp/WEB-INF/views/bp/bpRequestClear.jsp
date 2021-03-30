<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<%@ include file="../coverTop.jsp" %>

<%@ include file="bpSideNav.jsp" %>

<%--Main Contents--%>
<main class="col bg-faded py-4 flex-grow-1" style="font-family: Meiryo; margin-bottom: 150px; padding-left: 30px; padding-right: 25px;">
    <div class="card border-info text-center">
        <div class="card-header text-secondary">
            告知
        </div>
        <div class="card-body">
            <h5 class="card-title text-primary">リクエスト処理</h5>
            <p class="card-text text-secondary" style="margin-top: 10px;">リクエスト処理が完了しました。</p>
            <a href="../bp/bpList" class="btn btn-sm btn-info" style="color: white;">リストに移動</a>
        </div>
    </div>
</main>
</div>
<%--/Main Contents--%>


<%@ include file="../coverBottom.jsp" %>

</html>