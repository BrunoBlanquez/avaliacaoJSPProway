<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.dao.DaoPost" %>

<%
   String idPost =  request.getParameter("id");
   DaoPost.excluir(Integer.parseInt(idPost));
   response.sendRedirect("postagens.jsp");
%>