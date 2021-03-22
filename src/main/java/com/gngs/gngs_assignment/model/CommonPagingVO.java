package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommonPagingVO {

    private long rows = 20; // Each Page Count
    private long page = 1;
    private long totalPage;
    private long startPage = 1;
    private long endPage;
    private long pageScale = 5;

}
