package hdth.com.utils.common;

import java.util.Random;

public class Utils {

    public static String getRandomNumber(int len) {// tao chuoi ngau nhien tu 0 den 9
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }
}
