function fnGoPaging(page) {
    location.href="../bp/accountList?page=" + page;
}

function fnGoSearchPaging(page) {
    document.searchMove.page.value = page;
    document.searchMove.submit();
}

$(document).ready(function () {
   var searchType = document.searchMove.search_account_type.value;
   if(searchType != "") {
       $("#search_account_type").val(searchType).attr("selected", true);
   }
});