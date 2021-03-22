package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Vector;

@Getter
@Setter
public class AdditionalInformVO {
    private List<AccountVO> accountList = new Vector<AccountVO>();
    private String bp_id;
    private Integer overtime_day;
    private Integer overtime_month;
    private Integer overtime_year;
    private Integer holiday_work;
    private Integer extend_month;
    private Integer extend_times;
}
