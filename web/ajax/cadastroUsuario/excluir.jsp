<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="util.Conexao"%>  

<%
    String id = request.getParameter("txtid");

    Statement st = null;
    ResultSet rs = null;

    try {
        //java.util.Date dataAtual = new java.util.Date();
        //java.sql.Timestamp dataCadastro = new java.sql.Timestamp(dataAtual.getTime());

        st = new Conexao().conectar().createStatement();
        st.executeUpdate("DELETE FROM usuario WHERE id = '" + id + "'");
        out.println("Excluido");
    } catch (Exception e) {
        out.print(e);
    }
%>