<%@page import="net.docm.po.MyDoc"%>
<%@page import="net.docm.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

String id=request.getParameter("id");
MyDoc doc=new MyDoc();
doc.setId(request.getParameter("id"));
doc.setType(request.getParameter("type"));
doc.setKey(request.getParameter("key"));
doc.setHtmltext(request.getParameter("htmlcontent"));
//System.out.println(id);
boolean flag=Dao.getInstance().saveOrUpdate(doc);
if(flag){
	response.getWriter().println("1");
}else{
	response.getWriter().println("0");
}

%>