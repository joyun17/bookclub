package org.fullstack4.bookclub.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
    public static void setCookies(HttpServletResponse resp, String path, int eixpire, String name, String val) {
        Cookie cookie = new Cookie(name,val);
        cookie.setPath((path!=null&!path.isEmpty()?path:"/"));
        cookie.setMaxAge(eixpire);
        resp.addCookie(cookie);
    }

    public static String getCookieValue(HttpServletRequest req, String name) {
        String rtnCookie="";
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                if (name.equals(cookie.getName())) {
                    rtnCookie = cookie.getValue();
                    break;
                }
            }
        }
        return rtnCookie;
    }

    public static void setDeleteCookie(HttpServletResponse resp,String name) {
        setCookies(resp, "", 0, name, "");
    }
}
