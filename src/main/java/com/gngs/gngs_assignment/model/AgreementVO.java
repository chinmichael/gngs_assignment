package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AgreementVO {
    private String bp_id;

    //JOIN
    private String corporate_name;
    private String uuid;
    //JOIN END

    private String dispatch_code;
    private String dispatch_name;

    private String pattern;
    private String pattern_name;

    private Integer overtime_day;
    private Integer overtime_month;
    private Integer overtime_quarter;
    private Integer overtime_half;
    private Integer overtime_year;

    private Integer holiday_work;
    private Integer holiday_dayweek;
    private Integer check_month;
    private Integer check_date;
    private String start_date;
    private String end_date;
    private Double work_time;

    private Integer extend_day;
    private Integer extend_month;
    private Integer extend_quarter;
    private Integer extend_half;
    private Integer extend_year;

    private Integer agreement_type;
    private Integer count_limit;

    private String regist_date;
    private String origin_start_date;
}
