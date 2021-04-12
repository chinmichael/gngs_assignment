package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class AccountVO {
    private Integer rnum;
    private String bp_id;
    private String uuid;
    private String corporate_name;

    @Length(min=4, message = "銀行番号を確認してください。")
    private String bank_num;
    @NotBlank(message = "銀行名を入力してください。")
    private String bank_name;
    @Length(min=3, message = "支店番号を確認してください。")
    private String branch_num;
    @NotBlank(message = "支店名を入力してください。")
    private String branch_name;
    private Integer account_type;
    @Length(min=7, message = "口座番号を確認してください。")
    private String account_num;
    @NotBlank(message = "口座名義を入力してください。")
    private String account_name;

    private String regist_date;
}
