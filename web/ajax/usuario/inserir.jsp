<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="util.Conexao"%>

<%
    Statement st = null;
    ResultSet rs = null;

    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String fone = request.getParameter("fone");
    String cpf = request.getParameter("cpf");
    String dataNasc = request.getParameter("dataNasc");
    String funcao = request.getParameter("funcao");
    String senha = request.getParameter("senha");
    String permissao = request.getParameter("permissao");
    String departamento = request.getParameter("departamento");
    String dataAdmissao = request.getParameter("dataAdmissao");
    String status = request.getParameter("status");
    String fotoPerfil = request.getParameter("fotoPerfil");
    String observacoes = request.getParameter("observacoes");
    String id = request.getParameter("txtid");
    String antigo = request.getParameter("antigo");

    try {
        //VERIFICAR SE HÁ CAMPOS VAZIOS
        if (nome.equals("")) {
            out.println("Preencha");
            return;
        }

        java.util.Date dataAtual = new java.util.Date();
        java.sql.Timestamp dataCadastro = new java.sql.Timestamp(dataAtual.getTime());

        st = new Conexao().conectar().createStatement();

        //VERIFICA DUPLICIDADE
        if (!nome.equals(antigo)) {
            rs = st.executeQuery("SELECT * FROM usuario WHERE nome = '" + nome + "'");
            while (rs.next()) {
                rs.getRow();
                if (rs.getRow() > 0) {
                    out.println("Duplo");
                    return;
                }
            }
        }
        if (id.equals("")) {
            st.executeUpdate("INSERT INTO usuario (nome, email, fone, cpf, dataNasc, funcao, senha, permissao, departamento, dataAdmissao, status, fotoPerfil, observacoes, dataCadastro) values ('" + nome + "', '" + email + "', '" + fone + "', '" + cpf + "', '" + dataNasc + "', '" + funcao + "', '" + senha + "', '" + permissao + "', '" + departamento + "', '" + dataAdmissao + "', '" + status + "', '" + fotoPerfil + "', '" + observacoes + "', '" + dataCadastro + "')");
        } else {
            st.executeUpdate("UPDATE usuario SET nome = '" + nome + "', email = '" + email + "', fone = '" + fone + "', cpf = '" + cpf + "', dataNasc = '" + dataNasc + "', funcao = '" + funcao + "', senha = '" + senha + "', permissao = '" + permissao + "', departamento = '" + departamento + "', dataAdmissao = '" + dataAdmissao + "', status = '" + status + "', fotoPerfil = '" + fotoPerfil + "', observacoes = '" + observacoes + "', dataCadastro = '" + dataCadastro + "' WHERE id = '" + id + "'");
        }
        out.println("Salvo");
    } catch (Exception e) {
        out.print(e);
    }
%>
