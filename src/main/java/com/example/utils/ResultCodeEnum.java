package com.example.utils;

/**
 * 统一返回结果状态信息类
 *
 */
public enum ResultCodeEnum {

    // 成功
    SUCCESS(200,"success"),
    // 用户名错误
    USERNAME_ERROR(501,"usernameError"),
    // 密码错误
    PASSWORD_ERROR(503,"passwordError"),
    // 未登录
    NOTLOGIN(504,"notLogin"),
    // 用户名已存在
    USERNAME_USED(505,"userNameUsed"),
    // 安全问题错误
    SECURITYQUESTION_ERROR(506,"securityQuestionError"),
    // 安全答案错误
    SECURITYANSWER_ERROR(507,"securityAnswerError"),
    // 失败
    FAIL(508,"fail");

    private Integer code;
    private String message;
    private ResultCodeEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
    public Integer getCode() {
        return code;
    }
    public String getMessage() {
        return message;
    }
}
