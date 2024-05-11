package com.api.booker.utils;
/**
 * #Summary:
 * #Author: Imran Sheikh
 * #Creation Date:
 * #Comments:
 */

import org.apache.commons.lang3.RandomStringUtils;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class JavaHelper {

    public static String currentDate(String pattern) {
        Calendar c = Calendar.getInstance();
        Date date = c.getTime();
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(date);
    }

    public static String futureDate(String pattern) {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, 30);
        Date date = c.getTime();
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(date);
    }

    public static List<String> getDates(String pattern, int numberOfDays) {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, 30 - (numberOfDays+1));
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        List<String> dateList = new LinkedList<String>();
        for (int i = 0; i <= (numberOfDays * 2); i++) {
            c.add(Calendar.DATE, 1);
            String date = formatter.format(c.getTime());
            dateList.add(date);
        }
        return dateList;
    }

    public static String addingDaysToCurrentDate(String pattern, int daysToAdd){
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, daysToAdd);
        Date date = c.getTime();
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(date);
    }

    public static String addingDaysToWeekAhead(String pattern, int daysToAdd){
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, 7 + daysToAdd);
        Date date = c.getTime();
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(date);
    }

    public static String getRandomAlphanumericString(int length){
        return RandomStringUtils.randomAlphabetic(length);
    }


}