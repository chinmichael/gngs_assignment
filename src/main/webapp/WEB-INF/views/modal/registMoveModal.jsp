<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="registMoveModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body" id="moveTargetName" align="center" style="font-size: 12pt;font-weight: bold;"></div>
            <div align="center" style="color: #198754; font-size: 50pt; margin-bottom: 5px;">
                <i class="fas fa-arrow-alt-circle-left"></i>
            </div>
            <div>
                <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal"
                        style="margin-left:20px; margin-bottom:15px;padding-top: 7px;">&nbsp;いいえ&nbsp;</button>
                <button type="button" class="btn btn-success btn-sm" id="registMove"
                        style="float:right; margin-right: 20px; margin-bottom: 15px;padding-top: 7px;">&nbsp;はい&nbsp;</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function registMove(target, loc) {
        var targetName = target + "に移動しますか。";
        document.getElementById("moveTargetName").innerHTML=targetName;

        $("#registMove").attr("onclick","location.href='../bp/"+loc+"'");
    }
</script>