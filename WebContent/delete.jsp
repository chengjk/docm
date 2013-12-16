<%@page import="net.docm.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

String id=request.getParameter("id");
if(id==null||id==""){
	response.getWriter().println("-1");
	return;
}
Dao dao =new Dao();
System.out.println(id);
boolean flag=dao.deleteDoc(id);
if(flag){
	response.getWriter().println("1");
}else{
	response.getWriter().println("0");
}

%>