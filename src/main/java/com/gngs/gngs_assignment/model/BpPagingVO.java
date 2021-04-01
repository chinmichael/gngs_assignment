package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BpPagingVO extends CommonPagingVO {
    private long rows = 5; // Each Page Count
    private long pageScale = 3;

    private String search_name;
    private String search_type1;
    private Integer search_type2;
}
