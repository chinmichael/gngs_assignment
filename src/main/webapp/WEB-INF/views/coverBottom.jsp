<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- footer & bootstrap js --%>

<footer>
    <h4 align="center" style="font-size: 15pt; font-weight: bold; margin-top: 2.5px;">© G & G Service &nbsp;
        <a href=# style="font-size: 12pt; font-weight: normal">情報セキュリティ基本方針</a>&nbsp;
        <a href=# style="font-size: 12pt; font-weight: normal">個人情報規約</a>
    </h4>
    <h6 align="center" style="font-size: 10pt; margin-top: 15px;">Copyright(c) G&G Service All rights reserved.</h6>
</footer>
</div>
<c:if test="${not empty alertMessage}">
    <input type="hidden" value="${alertMessage}" id="alertMessage">
    <script type="text/javascript">
        window.onload=function () {
            alert($("#alertMessage").val());
        };
    </script>
</c:if>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
        src="../../resource/js/bootstrap.js"></script>

<script type="text/javascript">
    function pageClose() {
        window.close();
    }

    function pageTablePrint() {
        reportPrint(printTableArea.innerHTML);
    }

    function reportPrint(param) {
        var popupX = (document.body.offsetWidth / 2) - (841 / 2);
        var popupY= (window.screen.height / 2) - (890 / 2);
        const objWin = window.open('', 'print', 'status=no, height=890, width=841, left='+ popupX + ', top='+ popupY);
        objWin.document.open();
        objWin.document.write('<html><head><title>印刷ページ</title>');
        objWin.document.write('<link rel="stylesheet" type="text/css" href="../../resource/css/bootstrap.css"/>');
        objWin.document.write('<style type="text/css">@page { size: landscape; }</style>')
        objWin.document.write('</head><body>');
        objWin.document.write(param);
        objWin.document.write('</body></html>');
        objWin.focus();

        setTimeout(function(){
            objWin.print();
            objWin.close();
            }, 800);
    }

    /*var initBody;
    function beforePrint()
    {
        initBody = document.body.innerHTML;
        document.body.innerHTML = printArea.innerHTML;
    }
    function afterPrint()
    {
        document.body.innerHTML = initBody;
    }
    function pagePrint()
    {
        window.onbeforeprint = beforePrint;
        window.onafterprint = afterPrint;
        window.print();
    }*/

</script>