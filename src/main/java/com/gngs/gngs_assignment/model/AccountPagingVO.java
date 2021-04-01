package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountPagingVO extends CommonPagingVO {
    private String search_bank_name;
    private String search_branch_name;
    private String search_account_name;
    private Integer search_account_type;
}
