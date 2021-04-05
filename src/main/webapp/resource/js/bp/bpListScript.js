function fnGoPaging(page) {
    location.href="../bp/bpList?page=" + page;
}

function fnGoSearchPaging(page) {
    document.searchMove.page.value = page;
    document.searchMove.submit();
}

function changeSearchType2(type1) {
    var non = ["区分なし"]
    var bp = ["顧客","パートナー"];
    var comp1 = ["法人","自営業","その他"];
    var comp2 = ["零細","中小","大手","男","女"];
    var procedure = ["登録依頼","審査待ち","完了"];
    var deal = ["取引前","取引中","取引停止"];

    var set;

    if(type1.value == "0") set = non;
    else if(type1.value == "bp_type") set = bp;
    else if(type1.value == "corporate_type1") set = comp1;
    else if(type1.value == "corporate_type2") set = comp2;
    else if(type1.value == "procedure_status") set = procedure;
    else if(type1.value == "deal_status") set = deal;

    var target = document.getElementById("searchType2")
    target.options.length = 0;

    for (x in set) {
        var opt = document.createElement("option");
        opt.value = x;
        opt.innerHTML = set[x];
        target.appendChild(opt);
    }
}

$(document).ready(function () {
    var searchT1 = document.searchMove.searchType1.value;
    var searchT2 = document.searchMove.searchType2.value;

    if(searchT1 != "" && searchT2 != "") {
        $("#searchType1").val(searchT1).attr("selected", "true");
        var target = document.getElementById("searchType1");
        changeSearchType2(target);
        $("#searchType2").val(searchT2).attr("selected", "true");
    }
});