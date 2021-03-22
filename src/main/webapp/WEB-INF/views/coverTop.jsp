<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>G&G Service 契約管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://kit.fontawesome.com/f395ec79ea.js" crossorigin="anonymous"></script>
    <link rel="stylesheet"
          href="../../resource/css/bootstrap.css">
    <style type="text/css">
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #edf5fb;
        }

        .container-fluid {
            min-height: 90%;
            position: relative;
            overflow: auto;
        }

        footer {
            position: absolute;
            bottom: 0;
            right: 0;
            width: 100%;
            height: 85px;
            padding: 12px 0px;
            color: #848484;
            background-color: #E2E4E5;
        }
    </style>
</head>
<body>
<%-- Top navigation --%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid" style="overflow: visible; min-height: 0px; position: static;">

            <a class="navbar-brand" style="font-weight: bold; font-size: 20pt; margin-left: 10px;" href="../cover">G&G 外注管理</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarNavAltMarkup" style="margin-left: 12px;">

                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <c:if test="${not empty login}">
                    <li class="nav-item">
                        <a class="nav-link" href="../bp/bpList"
                            style="font-weight: bold;font-size: large;color: #b6d4fe; padding-right: 20px;">BP管理</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../item/itemList"
                           style="font-weight: bold;font-size: large;color: #b6d4fe; padding-right: 20px;">案件管理</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"
                           style="font-weight: bold;font-size: large;color: #b6d4fe;">契約管理</a>
                    </li>
                    </c:if>
                </ul>

                <ul class="navbar-nav me-sm-5 mb-0 mb-lg-0">
                    <c:choose>
                        <c:when test="${not empty login}">
                            <li class="nav-item dropdown" style="font-size: large;">
                                <a class="nav-link dropdown-toggle" href="#"
                                    id="navbarDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-user-circle" style="font-size: 18pt"></i>&nbsp;&nbsp;${login.username}
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="../logout">ログアウト</a></li>
                                    <%--<div class="dropdown-divider"></div>--%>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link" href="../loginForm" style="font-size: large;">
                                <i class="fas fa-user-check"></i> &nbsp;ログイン&nbsp; </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                </ul>
            </div>
        </div>
    </nav>
    <div style="min-height: 7px; background-color: #0c63e4"></div>

<%--/Top Navigation--%>