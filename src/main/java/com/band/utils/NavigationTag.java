package com.band.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Map;

public class NavigationTag extends TagSupport {
    static final long serialVersionUID = 2372405317744358833L;
    private String bean = "page";
    //分页跳转的url地址，必须
    private String url = null;
    //显示页码数量
    private int number = 5;
    public int doStartTag() throws JspException {
        JspWriter writer = pageContext.getOut();
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        Page page = (Page) request.getAttribute(bean);
        Integer integer= (Integer) request.getSession().getAttribute("value");
        if(page == null){
            return SKIP_BODY;
        }
        url = resolveUrl(url, pageContext);
        try{
            int pageCount = page.getTotal() / page.getSize();//总页数
            if(page.getTotal() % page.getSize() > 0){
                pageCount++;
            }
            String homeUrl = append(url, "page", 1);
            String backUrl = append(url, "page", pageCount);
            if(page.getPage() > 1){
                String preUrl = append(url, "page", page.getPage() - 1);
                preUrl  = append(preUrl, "rows", page.getSize());
                    writer.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + homeUrl + "\">" + "首</a></li>");
                    writer.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + preUrl + "\">" + "«</a></li>");
            }else{
                    writer.print("<li class=\"page-item\"><a class=\"page-link\" href=\"#\">" + "首</a></li>");
                    writer.print("<li class=\"page-item\"><a class=\"page-link\" href=\"#\">" + "«</a></li>");
            }
            //显示当前页码的前两页和后两页
            //int indexPage=(page.getPage()-2>0)?page.getPage()-2:1;
            int indexPage = 1;
            if(page.getPage() - 2 <= 0){
                indexPage = 1;
            }
            else if(pageCount - page.getPage() <= 2){
                indexPage = pageCount-4;
            } else{
                indexPage = page.getPage() - 2;
            }
            int j = page.getPage();
            for(int i = 1; i <= number && indexPage <= pageCount; indexPage++,i++){
                if(indexPage == page.getPage()){
                        writer.print("<li class=\"page-item active\"><a class=\"page-link\" href=\"#\">"
                                + indexPage + "</a></li>");
                    continue;
                }
                j++;
                String pageUrl = append(url, "page", indexPage);
                pageUrl = append(pageUrl, "rows", page.getSize());
                    writer.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + pageUrl + "\">" + indexPage + "</a></li>");
                if(page.getPage() < pageCount && (j - page.getPage() == 4) && j >= 5 && page.getPage() != pageCount){
                        String nextUrl = append(url, "page", page.getPage() + 1);
                        nextUrl = append(nextUrl, "rows", page.getSize());
                            writer.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + nextUrl + "\">" + "»</a></li>");
                            writer.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + backUrl + "\">" + "尾</a>");
                }else if(page.getPage() == pageCount && (j - page.getPage() == 5)){
                        writer.print("<li class=\"page-item\"><a class=\"page-link\" href=\"#\">" + "下一页</a></li>");
                        writer.print("<li class=\"page-item\"><a class=\"page-link\" href=\"#\">" + "尾</a>");
                }
            }
        }catch (IOException e){
            e.printStackTrace();
        }
        return SKIP_BODY;
    }
    private String append(String url, String key, int value){
        return append(url, key, String.valueOf(value));
    }
    private String append(String url, String key, String value) {
        if (url == null || url.trim().length() == 0) {
            return "";
        }
        if(url.indexOf("?") == -1){
            url = url + "?" + key + "=" + value;
        }else{
            if(url.endsWith("?")){
                url = url + key + "=" + value;
            }else{
                url = url + "&amp;" + key + "=" + value;
            }
        }
        return url;
    }
    private String resolveUrl(String url, javax.servlet.jsp.PageContext pageContext) throws JspException {
        Map params = pageContext.getRequest().getParameterMap();
        for(Object key : params.keySet()){
            if("page".equals(key) || "rows".equals(key)){
                continue;
            }
            Object value = params.get(key);
            if (value == null){
                continue;
            }
            if(value.getClass().isArray()){
                url = append(url, key.toString(), ((String[]) value) [0]);
            }else if(value instanceof String){
                url = append(url, key.toString(), value.toString());
            }
        }
        return url;
    }

    public String getBean() {
        return bean;
    }
    public String getUrl() {
        return url;
    }

    public int getNumber() {
        return number;
    }
    public void setBean(String bean) {
        this.bean = bean;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public void setNumber(int number) {
        this.number = number;
    }

}
