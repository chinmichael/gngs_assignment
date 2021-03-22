package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class LoginVO {
    @NotBlank(message = "IDを入力してください")
    private String userid;
    @NotBlank(message = "パスワードを入力してください")
    private String userpw;
    private String username;
}
