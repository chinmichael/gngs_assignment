package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MailVO {
    private String from="SampleTest<uzukiel77@naver.com>";
    private String to;
    private String subject;
    private String contents;
}
