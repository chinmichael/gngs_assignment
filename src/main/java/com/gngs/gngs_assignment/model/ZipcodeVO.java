package com.gngs.gngs_assignment.model;

import lombok.Data;

@Data
public class ZipcodeVO {
    private String code;
    private String zipcode5;
    private String zipcode;
    private String ken_kana;
    private String si_kana;
    private String machi_kana;
    private String ken;
    private String si;
    private String machi;
    private Integer ichi;
    private Integer nichi;
    private Integer sannchi;
    private Integer yochi;
    private Integer gochi;
}
