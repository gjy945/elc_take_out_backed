package com.example.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    // 私有构造函数，防止外部实例化
    private DateUtils() {
    }

    /**
     * 格式化日期为指定格式的字符串
     *
     * @param date  需要格式化的日期
     * @param format 日期格式
     * @return 格式化后的日期字符串
     */
    public static String formatDate(Date date, String format) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(date);
    }

    /**
     * 获取当前日期和时间的字符串表示，格式为 yyyy-MM-dd HH:mm:ss
     *
     * @return 当前日期和时间的字符串
     */
    public static String getCurrentDateTime() {
        return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 获取当前日期的字符串表示，格式为 yyyy-MM-dd
     *
     * @return 当前日期的字符串
     */
    public static String getCurrentDate() {
        return formatDate(new Date(), "yyyy-MM-dd");
    }

    /**
     * 获取当前时间的字符串表示，格式为 HH:mm:ss
     *
     * @return 当前时间的字符串
     */
    public static String getCurrentTime() {
        return formatDate(new Date(), "HH:mm:ss");
    }
}