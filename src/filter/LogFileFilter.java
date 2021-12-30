package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class LogFileFilter implements Filter {

    PrintWriter printWriter;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String fileName = filterConfig.getInitParameter("fileName");

        if (fileName == null)throw new ServletException("로그 파일을 찾을 수 없습니다.");

        try {
            printWriter = new PrintWriter(new FileWriter(fileName, true), true);
        }catch (IOException e){
            throw  new ServletException("로그 파일을 열 수 없습니다.");
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        printWriter.println("접속한 Client IP = " + servletRequest.getRemoteAddr());
        long start = System.currentTimeMillis();
        printWriter.println("접근한 URL 경로 = " + getURLPath(servletRequest));
        printWriter.println("요청 처리 시작 시간 = " + getCurrentTime());
        filterChain.doFilter(servletRequest,servletResponse);

        long end = System.currentTimeMillis();

        printWriter.println("요청 처리 종료 시간 = " + getCurrentTime());
        printWriter.println("요청 처리 소요 시간 = " + (end-start) + "ms");
        printWriter.println("================================================================");
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
        printWriter.close();
    }
}
