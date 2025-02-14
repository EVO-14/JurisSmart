<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="util.Conexao"%>

<%
    Statement st = null;
    ResultSet rs = null;

    String nome = request.getParameter("nome");
    String nacionalidade = request.getParameter("nacionalidade");
    String estadoCivil = request.getParameter("estadoCivil");
    String profissao = request.getParameter("profissao");
    String dataNasc = request.getParameter("dataNasc");
    String rg = request.getParameter("rg");
    String orgaoExpedidor = request.getParameter("orgaoExpedidor");
    String dataEmissao = request.getParameter("dataEmissao");
    String cpf = request.getParameter("cpf");
    String cep = request.getParameter("cep");
    String estado = request.getParameter("estado");
    String cidade = request.getParameter("cidade");
    String rua = request.getParameter("rua");
    String numero = request.getParameter("numero");
    String bairro = request.getParameter("bairro");
    String complemento = request.getParameter("complemento");
    String telefone = request.getParameter("telefone");
    String fone = request.getParameter("fone");
    String email = request.getParameter("email");
    String sexo = request.getParameter("sexo");
    String estadoNatu = request.getParameter("estadoNatu");
    String cidadeNatu = request.getParameter("cidadeNatu");
    String filiacao1 = request.getParameter("filiacao1");
    String filiacao2 = request.getParameter("filiacao2");
    String regimeCasamento = request.getParameter("regimeCasamento");
    String conjuge = request.getParameter("conjuge");
    String nomeSocial = request.getParameter("nomeSocial");
    String pisPasep = request.getParameter("pisPasep");
    String tituloEleitor = request.getParameter("tituloEleitor");
    String zonaEleitor = request.getParameter("zonaEleitor");
    String secaoEleitor = request.getParameter("secaoEleitor");
    String numeroCasamento = request.getParameter("numeroCasamento");
    String folhaCasamento = request.getParameter("folhaCasamento");
    String termoCasamento = request.getParameter("termoCasamento");
    String cartorioCasamento = request.getParameter("cartorioCasamento");
    String cidadeCasamento = request.getParameter("cidadeCasamento");
    String estadoCasamento = request.getParameter("estadoCasamento");
    String numeroNascimento = request.getParameter("numeroNascimento");
    String folhaNascimento = request.getParameter("folhaNascimento");
    String termoNascimento = request.getParameter("termoNascimento");
    String cartorioNascimento = request.getParameter("cartorioNascimento");
    String cidadeNascimento = request.getParameter("cidadeNascimento");
    String estadoNascimento = request.getParameter("estadoNascimento");
    String outros = request.getParameter("outros");
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
        if (!cpf.equals(antigo)) {
            rs = st.executeQuery("SELECT * FROM pessoa WHERE cpf = '" + cpf + "'");
            while (rs.next()) {
                rs.getRow();
                if (rs.getRow() > 0) {
                    out.println("Duplo");
                    return;
                }
            }
        }
        
        if (id.equals("")) {
            st.executeUpdate("INSERT INTO pessoa (nome, nacionalidade, estadoCivil, profissao, dataNasc, rg, orgaoExpedidor, dataEmissao, cpf, cep, estado, cidade, rua, numero, bairro, complemento, telefone, fone, email, sexo, estadoNatu, cidadeNatu, filiacao1, filiacao2, regimeCasamento, conjuge, nomeSocial, pisPasep, tituloEleitor, zonaEleitor, secaoEleitor, numeroCasamento, folhaCasamento, termoCasamento, cartorioCasamento, cidadeCasamento, estadoCasamento, numeroNascimento, folhaNascimento, termoNascimento, cartorioNascimento, cidadeNascimento, estadoNascimento, outros, dataCadastro) VALUES ('" + nome + "', '" + nacionalidade + "', '" + estadoCivil + "', '" + profissao + "', '" + dataNasc + "', '" + rg + "', '" + orgaoExpedidor + "', '" + dataEmissao + "', '" + cpf + "', '" + cep + "', '" + estado + "', '" + cidade + "', '" + rua + "', '" + numero + "', '" + bairro + "', '" + complemento + "', '" + telefone + "', '" + fone + "', '" + email + "', '" + sexo + "', '" + estadoNatu + "', '" + cidadeNatu + "', '" + filiacao1 + "', '" + filiacao2 + "', '" + regimeCasamento + "', '" + conjuge + "', '" + nomeSocial + "', '" + pisPasep + "', '" + tituloEleitor + "', '" + zonaEleitor + "', '" + secaoEleitor + "', '" + numeroCasamento + "', '" + folhaCasamento + "', '" + termoCasamento + "', '" + cartorioCasamento + "', '" + cidadeCasamento + "', '" + estadoCasamento + "', '" + numeroNascimento + "', '" + folhaNascimento + "', '" + termoNascimento + "', '" + cartorioNascimento + "', '" + cidadeNascimento + "', '" + estadoNascimento + "', '" + outros + "', '" + dataCadastro + "')");
        } else {
            st.executeUpdate("UPDATE pessoa SET nome = '" + nome + "', nacionalidade = '" + nacionalidade + "', estadoCivil = '" + estadoCivil + "', profissao = '" + profissao + "', dataNasc = '" + dataNasc + "', rg = '" + rg + "', orgaoExpedidor = '" + orgaoExpedidor + "', dataEmissao = '" + dataEmissao + "', cpf = '" + cpf + "', cep = '" + cep + "', estado = '" + estado + "', cidade = '" + cidade + "', rua = '" + rua + "', numero = '" + numero + "', bairro = '" + bairro + "', complemento = '" + complemento + "', telefone = '" + telefone + "', fone = '" + fone + "', email = '" + email + "', sexo = '" + sexo + "', estadoNatu = '" + estadoNatu + "', cidadeNatu = '" + cidadeNatu + "', filiacao1 = '" + filiacao1 + "', filiacao2 = '" + filiacao2 + "', regimeCasamento = '" + regimeCasamento + "', conjuge = '" + conjuge + "', nomeSocial = '" + nomeSocial + "', pisPasep = '" + pisPasep + "', tituloEleitor = '" + tituloEleitor + "', zonaEleitor = '" + zonaEleitor + "', secaoEleitor = '" + secaoEleitor + "', numeroCasamento = '" + numeroCasamento + "', folhaCasamento = '" + folhaCasamento + "', termoCasamento = '" + termoCasamento + "', cartorioCasamento = '" + cartorioCasamento + "', cidadeCasamento = '" + cidadeCasamento + "', estadoCasamento = '" + estadoCasamento + "', numeroNascimento = '" + numeroNascimento + "', folhaNascimento = '" + folhaNascimento + "', termoNascimento = '" + termoNascimento + "', cartorioNascimento = '" + cartorioNascimento + "', cidadeNascimento = '" + cidadeNascimento + "', estadoNascimento = '" + estadoNascimento + "', outros = '" + outros + "' WHERE id = '" + id + "'");
        }
        out.println("Salvo");
    } catch (Exception e) {
        out.print(e);
    }
%>