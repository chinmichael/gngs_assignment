package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Getter
@Setter
public class BpInformDetailVO extends BpInformVO {

    @NotBlank(message = "名前を入力してください")
    private String corporate_name_kana;
    @NotBlank(message = "名前を入力してください")
    private String corporate_name_eng;
    private Integer corporate_type2;
    private String corporate_birth;
    private String corporate_zipcode;
    private String corporate_address1;
    private String corporate_address2;

    @Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$",
            message = "電話番号をチェックしてください")
    private String corporate_tel;
    private String corporateTel1;
    private String corporateTel2;
    private String corporateTel3;

    private String corporate_fax;
    private String corporateFax1;
    private String corporateFax2;
    private String corporateFax3;

    private String corporate_homepage;
    private String corporate_applier;

    private String contract_phone;
    private String contractPhone1;
    private String contractPhone2;
    private String contractPhone3;

    private String dispatch_dept;
    private String dispatch_admin;
    private String dispatch_manager;

    @NotBlank(message = "メールをチェックしてください")
    @Email(message = "メールをチェックしてください")
    private String dispatch_mail;
    /*private String dispatchMail1;
    private String dispatchMail2;*/

    @Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$",
            message = "電話番号をチェックしてください")
    private String dispatch_tel;
    private String dispatchTel1;
    private String dispatchTel2;
    private String dispatchTel3;

    private String procedure_pass_date;
    private String deal_pass_date;

    private String note;
}
