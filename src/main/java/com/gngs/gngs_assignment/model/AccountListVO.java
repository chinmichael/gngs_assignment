package com.gngs.gngs_assignment.model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Vector;

@Getter
@Setter
public class AccountListVO {
    private List<AccountVO> accountList = new Vector<AccountVO>();
}
