$(document).ready(function () {
    var checkComp1 = $("#compType1").val();
    var checkComp2 = $("#compType2").val();
    var checkAccount = $("#accountType").val();

    if(checkComp1 != "") $("#corporate_type1").val(checkComp1).attr("selected", "true");
    if(checkComp2 != "") $("#corporate_type2").val(checkComp2).attr("selected", "true");
    if(checkAccount != "") $("#account_type").val(checkAccount).attr("selected", "true");
});

function registCheck() {
    var compTel = $("#corporateTel1").val() + "-" + $("#corporateTel2").val() + "-" + $("#corporateTel3").val();
    var compFax = $("#corporateFax1").val() + "-" + $("#corporateFax2").val() + "-" + $("#corporateFax3").val();
    var contractTel = $("#contractTel1").val() + "-" + $("#contractTel2").val() + "-" + $("#contractTel3").val();
    var contractPhone = $("#contractPhone1").val() + "-" + $("#contractPhone2").val() + "-" + $("#contractPhone3").val();
    var dispatchTel = $("#dispatchTel1").val() + "-" + $("#dispatchTel2").val() + "-" + $("#dispatchTel3").val();
    var birth = $("#corporateBirth").val();

    $("#corporateTel").val(compTel);
    $("#corporateFax").val(compFax);
    $("#contractTel").val(contractTel);
    $("#contractPhone").val(contractPhone);
    $("#dispatchTel").val(dispatchTel);
    $("#corporate_birth").val(birth);
}

function searchAddress () {
    var $zipcode = $("#zipcode");
    var zipcode = $zipcode.val();

    var $address = $("#address1");

    if(zipcode.length === 7) {
        $.ajax({
            url: "bpZipcodeCheck",
            type: "POST",
            data: {
                zipcode: zipcode
            },
            success: function (result) {
                $address.val(result.address);
            },
            error: function () {
                alert("err");
                $address.val('');
            }
        });
    } else {
        $address.val('');
        $zipcode.val('');
    }
}

function changeCompType(type) {
    var comp1 = ["零細","中小","大手"];
    var comp2 = ["男","女"];
    var set;
    var target = document.getElementById("corporate_type2");

    if(type.value == "0") set = comp1;
    else set = comp2;

    target.options.length = 0;

    for(x in set) {
        var opt = document.createElement("option");
        opt.value = x + 3;
        opt.innerHTML = set[x];
        target.appendChild(opt);
    }
}