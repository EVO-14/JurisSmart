<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="util.Conexao"%>  

<% String pag = "cadastroPessoa"; %>
<% String buscar = request.getParameter("buscar"); %>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<%
    out.println("<div class='table'>");
    out.println("<table class='table' id='cadItem'>");
    out.println("<thead>"
            + "<tr>"
            + "<th scope='col'>ID</th>"
            + "<th scope='col'>Nome</th>"
            + "<th scope='col'>CPF</th>"
            + "<th scope='col'>Ações</th>"
            + "</tr>"
            + "</thead>");
    out.println("<tbody>");
    try {
        st = new Conexao().conectar().createStatement();
        if (buscar != null) {
            buscar = '%' + buscar + '%';
            rs = st.executeQuery("SELECT * FROM pessoa WHERE nome LIKE '" + buscar + "'");//AND clienteId = '" + clienteUsuario + "'");
        } else {
            rs = st.executeQuery("SELECT * FROM pessoa");
        }
        while (rs.next()) {

            out.println("<tr>");
            out.println("<td class='cell id'>" + rs.getString(1) + "</td>");
            out.println("<td class='cell mid'>" + rs.getString(2) + "</td>");
            out.println("<td class='cell mid'>" + rs.getString(10) + "</td>");
            out.println("<td class='cell'><div class='d-grid gap-2 d-md-flex justify-content-center'>");
            out.println("<a href='" + pag + ".jsp?funcao=editar&id=" + rs.getString(1) + "' title='Editar registro'><img src='" + request.getContextPath() + "/imagens/icons/cadastro/pen-circle-svgrepo-com.svg' alt='[edit]'/></a>");
            out.println("<a href='" + pag + ".jsp?funcao=excluir&id=" + rs.getString(1) + "' title='Excluir registro'><img src='" + request.getContextPath() + "/imagens/icons/cadastro/trash-circle-fill-svgrepo-com.svg' alt='[delete]'/></a>");
            out.println("</div></td>");
            out.println("</tr>");
        }
    } catch (Exception e) {
        out.print(e);
    }
    out.println("</tbody></table></div>");
%>