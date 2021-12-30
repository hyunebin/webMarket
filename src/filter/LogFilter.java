package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class LogFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("WebMarket init");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("접속한 Client IP = " + servletRequest.getRemoteAddr());
        long start = System.currentTimeMillis();
        System.out.println("접근한 URL 경로 = " + getURLPath(servletRequest));
        System.out.println("요청 처리 시작 시간 = " + getCurrentTime());
        filterChain.doFilter(servletRequest,servletResponse);

        long end = System.currentTimeMillis();

        System.out.println("요청 처리 종료 시간 = " + getCurrentTime());
        System.out.println("요청 처리 소요 시간 = " + (end-start) + "ms");
        System.out.println("================================================================");
    }

    private String getCurrentTime() {
        DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        return format.format(calendar.getTime());

    }

    private String getURLPath(ServletRequest servletRequest) {
        HttpServletRequest httpServletRequest;
        String currentPath = "";
        String queryString = "";

        if(servletRequest instanceof HttpServletRequest){
            httpServletRequest = (HttpServletRequest)servletRequest;
            currentPath = httpServletRequest.getRequestURI();
            queryString = httpServletRequest.getQueryString();
            queryString = queryString == null ? "" : "?" + queryString;

        }
        return currentPath+queryString;
    }

    @Override
    public void destroy() {

    }
}
