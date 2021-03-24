package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountVO {
    private String bp_id;
    private String bank_num;
    private String bank_name;
    private String branch_num;
    private String branch_name;
    private Integer account_type;
    private String account_num;
    private String account_name;

}
