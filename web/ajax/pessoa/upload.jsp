<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="util.Upload"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="util.Conexao"%>

<%
    Statement st = null;
    ResultSet rs = null;

    String nome = "";
    String email = "";
    String fone = "";
    String cpf = "";
    String dataNasc = "";
    String funcao = "";
    String senha = "";
    String permissao = "";
    String departamento = "";
    String dataAdmissao = "";
    String status = "";
    String fotoPerfil = null;
    String observacoes = "";
    String id = "";
    String antigo = "";

    Upload up = new Upload();
    //Pasta que será salva
    up.setFolderUpload("img/usuario");

    if (up.formProcess(getServletContext(), request)) {
        try {
            nome = up.getForm().get("nome").toString();
            email = up.getForm().get("email").toString();
            fone = up.getForm().get("fone").toString();
            cpf = up.getForm().get("cpf").toString();
            dataNasc = up.getForm().get("dataNasc").toString();
            funcao = up.getForm().get("funcao").toString();
            senha = up.getForm().get("senha").toString();
            permissao = up.getForm().get("permissao").toString();
            departamento = up.getForm().get("departamento").toString();
            dataAdmissao = up.getForm().get("dataAdmissao").toString();
            status = up.getForm().get("status").toString();
            observacoes = up.getForm().get("observacoes").toString();
            id = up.getForm().get("txtid").toString();
            antigo = up.getForm().get("antigo").toString();
            fotoPerfil = up.getFiles().get(0).toString();
        } catch (Exception e) {
            fotoPerfil = "user.webp";
        }
        // INSERIR DADOS NO BANCO DE DADOS
        try {
            //VERIFICAR SE HÁ CAMPOS VAZIOS
            if (nome.equals("") || email.equals("") || cpf.equals("")) {
                out.println("Preencha");
                return;
            }

            java.util.Date dataAtual = new java.util.Date();
            java.sql.Timestamp dataCadastro = new java.sql.Timestamp(dataAtual.getTime());

            st = new Conexao().conectar().createStatement();

            //VERIFICA DUPLICIDADE
            if (!email.equals(antigo)) {
                rs = st.executeQuery("SELECT * FROM pessoa WHERE email = '" + email + "'");
                while (rs.next()) {
                    rs.getRow();
                    if (rs.getRow() > 0) {
                        out.println("Duplo");
                        return;
                    }
                }
            }
            if (id.equals("")) {
                st.executeUpdate("INSERT INTO pessoa (nome, email, fone, cpf, dataNasc, funcao, senha, permissao, departamento, dataAdmissao, status, fotoPerfil, observacoes, dataCadastro) values ('" + nome + "', '" + email + "', '" + fone + "', '" + cpf + "', '" + dataNasc + "', '" + funcao + "', '" + senha + "', '" + permissao + "', '" + departamento + "', '" + dataAdmissao + "', '" + status + "', '" + fotoPerfil + "', '" + observacoes + "', '" + dataCadastro + "')");
            } else {
                if (fotoPerfil.equals("user.webp")) {
                    st.executeUpdate("UPDATE pessoa SET nome = '" + nome + "', email = '" + email + "', fone = '" + fone + "', cpf = '" + cpf + "', dataNasc = '" + dataNasc + "', funcao = '" + funcao + "', senha = '" + senha + "', permissao = '" + permissao + "', departamento = '" + departamento + "', dataAdmissao = '" + dataAdmissao + "', status = '" + status + "', observacoes = '" + observacoes + "', dataCadastro = '" + dataCadastro + "' WHERE id = '" + id + "'");
                } else {
                    st.executeUpdate("UPDATE pessoa SET nome = '" + nome + "', email = '" + email + "', fone = '" + fone + "', cpf = '" + cpf + "', dataNasc = '" + dataNasc + "', funcao = '" + funcao + "', senha = '" + senha + "', permissao = '" + permissao + "', departamento = '" + departamento + "', dataAdmissao = '" + dataAdmissao + "', status = '" + status + "', fotoPerfil = '" + fotoPerfil + "', observacoes = '" + observacoes + "', dataCadastro = '" + dataCadastro + "' WHERE id = '" + id + "'");
                }
            }
            out.println("Salvo");
        } catch (Exception e) {
            out.print(e);
        }
    }
%>