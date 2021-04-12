$(document).ready(function () {
   var checkAccountType = $("accountType").val();

   if(accountType != "") $("account_type").val(checkAccountType).attr("selected", "true");
});