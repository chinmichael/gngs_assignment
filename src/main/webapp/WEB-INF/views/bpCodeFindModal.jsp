<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="modal fade" id="bpCodeFindModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body" align="center" style="font-size: 12pt;font-weight: bold;">

                <table class="table table-bordered"
                       style="font-size: 11pt; text-align: center; font-weight: normal;" id="bpCodeTable">
                    <thead>
                    <tr>
                        <th style="width: 120px;background-color: #E6E6E6; font-weight: bold;" valign="middle">
                            検索条件
                        </th>
                        <td colspan="5">
                            <div class="row g-2" align="center">
                                <div class="col-sm-auto">
                                    <select class="form-select form-select-sm" id="code_search_type1" name="code_search_type1"
                                            onchange="changeSearchType2(this)">
                                        <option value="0" selected>区分なし</option>
                                        <option value="bp_type">BP区分</option>
                                        <option value="corporate_type1">企業区分</option>
                                        <option value="corporate_type2">詳細区分</option>
                                        <option value="procedure_status">手続き状況</option>
                                        <option value="deal_status">取引状況</option>
                                    </select>
                                </div>
                                <div class="col-sm-auto">
                                    <select class="form-select form-select-sm" id="code_search_type2" name="code_search_type2">
                                        <option value="0">区分なし</option>
                                    </select>
                                </div>
                                <div class="col-sm-auto">
                                    <input type="text" class="form-control form-control-sm" id="code_search_name"
                                           name="code_search_name" value="${code_search_name}" placeholder="会社(氏)名"/>
                                </div>
                                <div class="col-sm-auto">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                            onclick="searchBpCode()"><i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </thead>
                </table>
            </div>

            <div id="pagingSpace">

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function searchBpCode() {
        var searchType1 = $("#code_search_type1").val();
        var searchType2 = $("#code_search_type2").val();
        var searchName = $("#code_search_name").val();

        $("#tableListName").remove();
        $("#tableListContent").remove();

        $.ajax({
           url: "bpCodeSearch",
           type: "POST",
            data: {
                code_search_type1: searchType1,
                code_search_type2: searchType2,
                code_search_name: searchName
            },
            success: function(result) {

                if(result.error) {
                    alert(result.error);
                }

                if(result.pagingList.length != '0') {

                    var listName =  "<thead id='tableListName' style='font-weight: bold;background-color: #E6E6E6;' class='table-bordered'><tr>"+
                                    "<td>BPコード</td>" +
                                    "<td>会社(氏)名</td>" +
                                    "<td>BP区分</td>" +
                                    "<td>企業区分</td>" +
                                    "<td>詳細区分</td>" +
                                    "<td>登録日</td>" + "</tr></thead>";

                    $("#bpCodeTable").append(listName);

                    $("#bpCodeTable").append("<tbody id='tableListContent'>");

                    for(i=0; i < result.pagingList.length; i++) {
                        var bpType;
                        if(result.pagingList[i].bp_type == 0) {
                            bpType = "顧客";
                        } else {
                            bpType = "パートナー";
                        }
                        var compType1
                        switch (result.pagingList[i].corporate_type1) {
                            case 0:
                                compType1 = "法人";
                                break;
                            case 1:
                                compType1 = "自営業";
                                break;
                            case 2:
                                compType1 = "その他";
                                break;
                        }
                        var compType2
                        switch (result.pagingList[i].corporate_type2) {
                            case 0:
                                compType2 = "零細";
                                break;
                            case 1:
                                compType2 = "中小";
                                break;
                            case 2:
                                compType2 = "大手";
                                break;
                            case 3:
                                compType2 = "男";
                                break;
                            case 4:
                                compType2 = "女";
                                break;
                            default:
                                compType2 = "";
                                break;
                        }

                        var listTag =   "<tr>" +
                                        "<td><a href=# onclick='setBpCode(this)' data-bs-dismiss='modal'>" + result.pagingList[i].bp_id + "</a></td>" +
                                        "<td>" + result.pagingList[i].corporate_name + "</td>" +
                                        "<td>" + bpType + "</td>" +
                                        "<td>" + compType1 + "</td>" +
                                        "<td>" + compType2 + "</td>" +
                                        "<td>" + result.pagingList[i].regist_date +
                                        "</td>" + "</tr>";
                        $("#bpCodeTable").append(listTag);
                    }
                    $("#bpCodeTable").append("</tbody>");

                    var end = result.resMap.endPage > result.resMap.totalPage ?
                                result.resMap.totalPage : result.resMap.endPage;
                    for(i=result.resMap.startPage;
                        i<=end;
                        i++) {

                    }

                }
            },
            error: function() {
                alert("err");
            }
        });
    }

    function setBpCode(anchor) {
        var code = anchor.innerText;
        $("#tableListName").remove();
        $("#tableListContent").remove();
        $("#setModalBpCode").val(code);
    }

    function changeSearchType2(type1) {
        var non = ["区分なし"];
        var bp = ["顧客","パートナー"];
        var comp1 = ["法人","自営業","その他"];
        var comp2 = ["零細","中小","大手","男","女"];
        var procedure = ["登録依頼","審査待ち","完了"];
        var deal = ["取引前","取引中","取引停止"];

        var set;

        switch (type1.value) {
            case "0":
                set = non;
                break;
            case "bp_type":
                set = bp;
                break;
            case "corporate_type1":
                set = comp1;
                break;
            case "corporate_type2":
                set = comp2;
                break;
            case "procedure_status":
                set = procedure;
                break;
            case "deal_status":
                set = deal;
                break;
        }

        var target = document.getElementById("code_search_type2")
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
</script>