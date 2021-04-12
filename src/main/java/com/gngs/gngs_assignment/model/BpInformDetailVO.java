package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PastOrPresent;
import javax.validation.constraints.Pattern;
import java.text.SimpleDateFormat;
import java.util.Date;

@Getter
@Setter
public class BpInformDetailVO extends BpInformVO {

    @NotBlank(message = "名前を入力してください")
    private String corporate_name_kana;
    @NotBlank(message = "名前を入力してください")
    private String corporate_name_eng;
    private Integer corporate_type2;

    @PastOrPresent(message = "日付を確認してください")
    private Date check_corporate_birth;
    @NotBlank(message = "日付を入力してください")
    private String corporate_birth;
    public void setCorporate_birth(String corporate_birth) {
        this.corporate_birth = corporate_birth;
        SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
        if(corporate_birth != null || corporate_birth.isEmpty()) {
            if(corporate_birth != "") {
                try {
                    Date convertBirth = fm.parse(corporate_birth);
                    check_corporate_birth = convertBirth;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Length(min=7, message = "郵便番号を確認してください")
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

    @NotBlank(message = "派遣元部署名を入力してください")
    private String dispatch_dept;
    @NotBlank(message = "派遣元役職名を入力してください")
    private String dispatch_admin;
    @NotBlank(message = "派遣元担当者名を入力してください")
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
