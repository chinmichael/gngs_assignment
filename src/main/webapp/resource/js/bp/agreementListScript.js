function fnGoPaging(page) {
    location.href="../bp/agreementList?page=" + page;
}

function fnGoSearchPaging(page) {
    document.searchMove.page.value = page;
    document.searchMove.submit();
}