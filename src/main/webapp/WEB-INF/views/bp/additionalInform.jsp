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

        <%--Regist Form--%>

            <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px">
                口座情報登録</h3>

            <!--Account Table-->

            <!--/Account Table-->

            <!--Agreement Table-->
            <h3 style="font-size: 20pt;font-weight: bold;text-decoration-line: underline;margin-bottom: 20px">
                36協定情報登録</h3>


            <!--/Agreement Table-->

            <%--Regist Buttons--%>

            <%--/Regist Buttons--%>

        <%--/Regist Form--%>

    </main>
</div>
<%--/Main Contents--%>


<%@ include file="../coverBottom.jsp" %>

<script src="//api.zipaddress.net/sdk/zipaddr.min.js" async></script>

<script type="text/javascript">

</script>

</html>