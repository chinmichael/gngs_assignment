package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BpCodePagingVO extends CommonPagingVO {
    private String code_search_name;
    private String code_search_type1;
    private Integer code_search_type2;
}
