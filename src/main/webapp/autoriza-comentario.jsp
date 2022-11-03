<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.blog.dao.DaoComentario" %>

<%
    String idComentario = request.getParameter("id");
    System.out.println(idComentario);
    DaoComentario.aprovar(Integer.parseInt(idComentario));
    response.sendRedirect("postagens.jsp");
%>