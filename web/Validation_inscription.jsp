<%-- 
    Document   : Validation_inscription
    Created on : 7 avr. 2020, 17:35:55
    Author     : Lorenzo
--%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<%
    String eMail    = request.getParameter("inscriptionEMail");
    boolean ok = Client.create(con, "text-1", "text-2", "url-1", eMail);
%>
