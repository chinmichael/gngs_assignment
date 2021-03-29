<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<body>
<%--Side Navigation--%>
<div class="container-fluid">
    <div class="row min-vh-100 flex-column flex-xl-row">

        <aside class="col-xl-2 bg-light flex-shrink-1" style="overflow: auto;">

            <nav class="navbar navbar-expand-xl navbar-light bg-light flex-xl-column flex-md-row align-items-start py-2">
                <a class="navbar-brand" href=#
                   style="font-size: 16pt;font-weight: bold;margin-top:3px;margin-left: 12px;font-family: Meiryo; color: #A4A4A4;">
                    BP 管理メニュー</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <div class="navbar-nav">
                        <ul class="flex-md-column navbar-nav w-100 justify-content-between"
                            style="font-family: Meiryo;font-weight: bold;margin-left: 12px;">

                            <!-- Detail Menu -->

                            <li class="nav-item" style="margin-top:5px;">
                                <a class="nav-link" href=../bp/bpList>
                                    <i class="far fa-dot-circle"></i>&nbsp;&nbsp;BP情報一覧
                                </a>
                            </li>

                            <li class="nav-item" style="margin-top:5px;">
                                <a class="nav-link" href=#>
                                    <i class="far fa-dot-circle"></i>&nbsp;&nbsp;口座情報一覧
                                </a>
                            </li>

                            <li class="nav-item" style="margin-top:5px;">
                                <a class="nav-link" href="../bp/agreementList">
                                    <i class="far fa-dot-circle"></i>&nbsp;&nbsp;36協定情報一覧
                                </a>
                            </li>

                            <!-- /Detail Menu -->
                        </ul>
                    </div>
                </div>
            </nav>
        </aside>
<%--/Side Navigation--%>

<%--Login status check--%>
<c:if test="${empty login}">
    <script type="text/javascript">
        window.onload = function () {
            alert("ログイン情報がありません。");
            location.href="../loginForm"
        };
    </script>
</c:if>
<%--/Login status check--%>