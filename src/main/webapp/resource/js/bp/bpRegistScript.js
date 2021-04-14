$(document).ready(function () {
    var checkComp1 = $("#compType1").val();
    var checkComp2 = $("#compType2").val();
    var checkAccount = $("#accountType").val();

    if(checkComp1 != "") $("#corporate_type1").val(checkComp1).attr("selected", "true");
    if(checkComp2 != "") $("#corporate_type2").val(checkComp2).attr("selected", "true");
    if(checkAccount != "") $("#account_type").val(checkAccount).attr("selected", "true");

    var date = [];
    var check_month = document.getElementById("check_month");
    for(var i = 0; i < 12; i++) {
            date[i] = i + 1;
    }
    for(x in date) {
        var opt = document.createElement("option");
        opt.value = x + 1;
        opt.innerHTML = date[x];
        check_month.appendChild(opt);
    }

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

function settingDate() {
    var date30 = [];
    var date31 = [];
    var date28 = [];
    var set;
    var $checkMonth = $("#check_month");
    var $target = $("#check_date");

    var check30 = ["4","6","9","11"];

    if($checkMonth.val() == "2") {
        for(var i=0; i < 28; i++) {
            date28[i] = i + 1;
        }
        set = date28;

    } else if (check30.includes($checkMonth.val())) {
        for(var i=0; i < 30; i++) {
            date30[i] = i + 1;
            set = date30;
        }
        set = date30;

    } else {
        for(var i=0; i < 31; i++) {
            date31[i] = i + 1;
        }
        set = date31;
    }

    $target.options.length = 0;

    for(x in set) {
        var opt = document.createElement("option");
        opt.value = x + 1;
        opt.innerHTML = set[x];
        $target.appendChild(opt);
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
        if(type.value == "0") opt.value = x;
        else opt.value = x + 3;
        opt.innerHTML = set[x];
        target.appendChild(opt);
    }
}