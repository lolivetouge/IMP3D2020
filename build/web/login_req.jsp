<%-- 
    Document    : login_req
    Description : recoit par Ajax le mot de passe pour identifier et se connecter
    Created on  : Avril 2019
    Author      : Fabre
--%>

<%@page import="com.metier.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.persistence.*"%>

<%
    Connection con = (Connection) session.getAttribute("con");
    //si il n'y a aucun cookie de session on cr�e la connection
    if (con == null) {
        con = ConnexionMySQL.newConnexion();
        session.setAttribute("con", con);
    }
    session.setAttribute("con", con);
    String mail = request.getParameter("mail");
    // on r�cup�re le mdp saisi
    String password = request.getParameter("mdp");
    
    //On cr�e des objets utilisateur et op�rateur identifi�s par leur mail car on ne sait pas 
    //si la personne qui se connecte est un utilisateur ou un op�rateur
    Utilisateur utilisateur = Utilisateur.getByMail(con, mail);
    Operateur operateur = Operateur.getByMail(con, mail);
    
    // la personne existe t'elle ?
    if (utilisateur != null) {
        String pwd1 = utilisateur.getMdp();
        //On encrypte le mot de passe pour le comparer a celui de la BDD 2020
        String pwd2 = com.persistence.Utils.encryptPassword(password);
        
        // le mot de passe est t'il bon ?
        if (pwd2.equals(pwd1)) {
            // cr�ation de l'utilisateur dans l'objet session de Tomcat
            session.setAttribute("utilisateur", utilisateur);
            request.getRequestDispatcher("u_accueil.jsp").forward(request, response);
        }
    }
    else if (operateur != null) {
        String pwd1 = operateur.getMdp();
        String pwd2 = com.persistence.Utils.encryptPassword(password);
        // le mot de passe est t'il bon ?
        if (pwd2.equals(pwd1)) {
            // cr�ation de l'operateur dans l'objet session de Tomcat
            session.setAttribute("operateur", operateur);
            request.getRequestDispatcher("o_accueil.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("index.jsp?message=pbLogin").forward(request, response);
        }
    }
    else {      // le mail n'existe pas
        request.getRequestDispatcher("index.jsp?message=pbLogin").forward(request, response);
    }
%>