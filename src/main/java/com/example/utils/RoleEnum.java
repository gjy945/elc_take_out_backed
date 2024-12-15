package com.example.utils;

import lombok.Getter;

@Getter
public enum RoleEnum {
    STUDENT("学生", 1),
    TEACHER("教师", 2),
    ADMIN("管理员", 3);

    private final String name;
    private final int index;

    RoleEnum(String name, int index) {
        this.name = name;
        this.index = index;
    }

}
