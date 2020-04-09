<%-- 
    Document   : reqInscription
    Created on : 31 mars 2020, 08:49:05
    Author     : Lorenzo
--%>
<%@page import="com.metier.*"%>
<%@page import="com.persistence.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String eMail    = request.getParameter("inscriptionEMail");
    boolean ok = SmtpSend.sendMessage("Validation de la page d'inscription", "Bonjour,\nSuite à votre inscription, nous vous envoyons ci-dessous un lien vers le site de l'imprimante 3D.\nAprès avoir rempli le formulaire d'inscription, vous pourrez nous transmettre les pièces que vous souhaitez imprimer.", eMail);
%>