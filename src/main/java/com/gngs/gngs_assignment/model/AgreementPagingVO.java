package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AgreementPagingVO extends CommonPagingVO {
    private String search_dispatch;
    private String search_pattern_code;
    private String search_pattern_name;
}
