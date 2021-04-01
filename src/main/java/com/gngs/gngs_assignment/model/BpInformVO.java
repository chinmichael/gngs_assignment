package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Getter
@Setter
public class BpInformVO {

    private Integer rnum;

    private String bp_id;
    private Integer bp_type;
    @NotBlank(message = "名前を入力してください")
    private String corporate_name;
    private Integer corporate_type1;
    private String contract_dept;
    private String contract_manager;

    @NotBlank(message = "メールをチェックしてください")
    @Email(message = "メールをチェックしてください")
    private String contract_mail;
    /*private String mailAddress1;
    private String mailAddress2;*/

    @Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$",
            message = "電話番号をチェックしてください")
    private String contract_tel;
    private String contractTel1;
    private String contractTel2;
    private String contractTel3;

    private Integer procedure_status;
    private Integer deal_status;
    private String regist_date;
    private String userid;
    private String uuid;
    private String uuid_date;

    private String regist_date;

}
