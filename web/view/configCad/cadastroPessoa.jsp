<%@ include file="../template/_cabecalho.jsp" %>
<%@ include file="../template/_lateral.jsp" %>

<% String pag = "cadastroPessoa";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>| JurisSmart - Pessoa |</title>
        <style>
            main img {
                width: 50px;
            }

            .dark-mode main img,
            .dark-mode main .search input{
                filter: invert(1);
            }

            .search {
                display: flex;
                align-items: center;
                justify-content: space-around;
            }

            .search .search-left {
                width: 70%;
            }

            .search .search-right {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .search .search-left form {
                display: flex;
                align-items: center;
                justify-content: space-around;
                width: 100%;
            }

            .search .search-left form button {
                background-color: transparent;
                border: none;
                border-radius: 50%;
            }

            .search .search-left form input {
                width: 80%;
            }

            .container {
                padding-top: 4rem;
            }

            .container th,
            .dark-mode .container th{
                text-align: center;
                border-right: 15px solid var(--border-color);
                border-left: 15px solid var(--border-color);
                border-bottom: none;
                background-color: var(--table-cbc);
                color: var(--text-color);
                font-weight: bold;
                font-size: 80%;
            }

            .container .cell {
                text-align: left;
                background-color: var(--table-body);
                border-bottom: 15px solid var(--border-color);
                border-right: 15px solid var(--border-color);
                border-left: 15px solid var(--border-color);
                border-top: 5px solid var(--border-color);
                color: var(--text-color);
            }

            .dark-mode .container .cell {
                text-align: left;
                background-color: var(--table-body);
                border-bottom: 15px solid var(--border-color);
                border-right: 15px solid var(--border-color);
                border-left: 15px solid var(--border-color);
                border-top: 5px solid var(--border-color);
                color: var(--text-color);
            }

            .container .mid {
                width: 60%;
            }

            .container .cell div>a>img {
                width: 100%;
            }

            .container table tbody tr .cell a img {
                width: 30px;
            }

            .modalCadastrarPessoa {
                margin-top: 80px;
            }

            .modalCadastrarPessoa .modal-body {
                max-height: calc(80vh - 120px);
                overflow-y: auto;
            }

            .dark-mode .container .modal-body {
                background-color: var(--background-color);
            }

            /* POPUP */
            .alert-danger {
                position: fixed;
                top: 85%;
                left: 45%;
                transition: opacity 0.8s ease;
                background-color: #b6202c;//#db2635;
                color: white;
                font-weight: bold;
            }

            .popup-content {
                font-size: 16px;
            }

            .alert-success {
                position: fixed;
                top: 85%;
                left: 45%;
                transition: opacity 0.8s ease;
                background-color: #11a361;
                color: white;
                font-weight: bold;
            }

            .popup-content-suc {
                font-size: 16px;
            }

            .invalid-feedback {
                display: none;
                color: red;
                font-size: 0.9em;
            }
        </style>
    </head>

    <body>
        <main id="main">
            <div class="search">
                <div class="search-left">
                    <form method="post" id="search" class="search">
                        <button type="submit" id="btn-buscar" name="btn-buscar" title="[Consultar Pessoa]">
                            <img src="<%= request.getContextPath()%>/imagens/icons/cadastro/search-alt-2-svgrepo-com.svg" alt="[Buscar]">
                        </button>
                        <input type="search" name="buscar" id="buscar" placeholder="Buscar pelo nome" class="form-control">
                    </form>
                </div>
                <div class="search-right">
                    <a href="<%=pag%>.jsp?funcao=novo" id="bt-novo-cad-funcoes" title="Novo Cadastro">
                        <img src="<%= request.getContextPath()%>/imagens/icons/cadastro/plus-square-svgrepo-com.svg" alt="[Adicionar Novo]">
                    </a>
                </div>
            </div>
            <div class="container">
                <div id="listar" class="listar"></div>
                <div id="mensagem" hidden></div>
            </div>
        </main>

        <div class="modal fade modalCadastrarPessoa" id="cadastrarPessoaModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-xl">
                <div class="modal-content modal-content-scrollable">
                    <div class="modal-header">
                        <%
                            String titulo = "";
                            String nome = "";
                            String nacionalidade = "";
                            String estadoCivil = "";
                            String profissao = "";
                            String dataNasc = "";
                            String rg = "";
                            String orgaoExpedidor = "";
                            String dataEmissao = "";
                            String cpf = "";
                            String cep = "";
                            String estado = "";
                            String cidade = "";
                            String rua = "";
                            String numero = "";
                            String bairro = "";
                            String complemento = "";
                            String telefone = "";
                            String fone = "";
                            String email = "";
                            String sexo = "";
                            String estadoNatu = "";
                            String cidadeNatu = "";
                            String filiacao1 = "";
                            String filiacao2 = "";
                            String regimeCasamento = "";
                            String conjuge = "";
                            String nomeSocial = "";
                            String pisPasep = "";
                            String tituloEleitor = "";
                            String zonaEleitor = "";
                            String secaoEleitor = "";
                            String numeroCasamento = "";
                            String folhaCasamento = "";
                            String termoCasamento = "";
                            String cartorioCasamento = "";
                            String cidadeCasamento = "";
                            String estadoCasamento = "";
                            String numeroNascimento = "";
                            String folhaNascimento = "";
                            String termoNascimento = "";
                            String cartorioNascimento = "";
                            String cidadeNascimento = "";
                            String estadoNascimento = "";
                            String outros = "";
                            String id = "";
                            if (request.getParameter("id") != null) {
                                titulo = "Editar Pessoa";
                                id = request.getParameter("id");
                                try {
                                    st = new Conexao().conectar().createStatement();
                                    rs = st.executeQuery("SELECT * FROM pessoa WHERE id = '" + id + "'");
                                    while (rs.next()) {
                                        nome = rs.getString(2);
                                        nacionalidade = rs.getString(3);
                                        estadoCivil = rs.getString(4);
                                        profissao = rs.getString(5);
                                        dataNasc = rs.getString(6);
                                        rg = rs.getString(7);
                                        orgaoExpedidor = rs.getString(8);
                                        dataEmissao = rs.getString(9);
                                        cpf = rs.getString(10);
                                        cep = rs.getString(11);
                                        estado = rs.getString(12);
                                        cidade = rs.getString(13);
                                        rua = rs.getString(14);
                                        numero = rs.getString(15);
                                        bairro = rs.getString(16);
                                        complemento = rs.getString(17);
                                        telefone = rs.getString(18);
                                        fone = rs.getString(19);
                                        email = rs.getString(20);
                                        sexo = rs.getString(21);
                                        estadoNatu = rs.getString(22);
                                        cidadeNatu = rs.getString(23);
                                        filiacao1 = rs.getString(24);
                                        filiacao2 = rs.getString(25);
                                        regimeCasamento = rs.getString(26);
                                        conjuge = rs.getString(27);
                                        nomeSocial = rs.getString(28);
                                        pisPasep = rs.getString(29);
                                        tituloEleitor = rs.getString(30);
                                        zonaEleitor = rs.getString(31);
                                        secaoEleitor = rs.getString(32);
                                        numeroCasamento = rs.getString(33);
                                        folhaCasamento = rs.getString(34);
                                        termoCasamento = rs.getString(35);
                                        cartorioCasamento = rs.getString(36);
                                        cidadeCasamento = rs.getString(37);
                                        estadoCasamento = rs.getString(38);
                                        numeroNascimento = rs.getString(39);
                                        folhaNascimento = rs.getString(40);
                                        termoNascimento = rs.getString(41);
                                        cartorioNascimento = rs.getString(42);
                                        cidadeNascimento = rs.getString(43);
                                        estadoNascimento = rs.getString(44);
                                        outros = rs.getString(45);
                                    }
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            } else {
                                titulo = "Cadastrar Pessoa";
                            }
                        %>

                        <h1 class="modal-title fs-5" id="exampleModalLabel">
                            <%=titulo%>
                        </h1>
                        <button type="button" class="btn-close" id="btn-fechar" name="btn-fechar" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="post" id="fc">
                        <div class="modal-body">
                            <input type="hidden" name="txtantigo" id="txtantigo" >
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="nome" class="col-form-label">Nome</label>
                                        <input value="<%=nome%>" type="text" class="form-control" id="nome" name="nome" placeholder="Digite o nome" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="nacionalidade" class="col-form-label">Nacionalidade</label>
                                        <input value="<%=nacionalidade%>" type="text" class="form-control" id="nacionalidade" name="nacionalidade" placeholder="Digite a nacionalidade">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="estadoCivil" class="col-form-label">Estado Civil</label>
                                        <select id="estadoCivil" name="estadoCivil" class="form-select" aria-label="Estado Civil">
                                            <option value="" <%= estadoCivil.isEmpty() ? "disabled hidden" : ""%>>
                                                <%
                                                    switch (estadoCivil) {
                                                        case "SO":
                                                            out.print("Solteiro(a)");
                                                            break;
                                                        case "CA":
                                                            out.print("Casado(a)");
                                                            break;
                                                        case "DI":
                                                            out.print("Divorciado(a)");
                                                            break;
                                                        case "VI":
                                                            out.print("Viúvo(a)");
                                                            break;
                                                        default:
                                                            out.print("Selecione um estado civil");
                                                    }
                                                %>
                                            </option>
                                            <option value="SO" <%= estadoCivil.equals("SO") ? "hidden" : ""%>>Solteiro(a)</option>
                                            <option value="CA" <%= estadoCivil.equals("CA") ? "hidden" : ""%>>Casado(a)</option>
                                            <option value="DI" <%= estadoCivil.equals("DI") ? "hidden" : ""%>>Divorciado(a)</option>
                                            <option value="VI" <%= estadoCivil.equals("VI") ? "hidden" : ""%>>Viúvo(a)</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="profissao" class="col-form-label">Profissão</label>
                                        <input value="<%=profissao%>" type="text" class="form-control" id="profissao" name="profissao" placeholder="Digite a profissão">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="dataNasc" class="col-form-label">Data de Nascimento</label>
                                        <input value="<%=dataNasc%>" type="date" class="form-control" id="dataNasc" name="dataNasc">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="sexo" class="col-form-label">Sexo</label>
                                        <select id="sexo" name="sexo" class="form-select" aria-label="Sexo">
                                            <option value="" <%= sexo.isEmpty() ? "disabled hidden" : ""%>>
                                                <%
                                                    switch (sexo) {
                                                        case "M":
                                                            out.print("Masculino");
                                                            break;
                                                        case "F":
                                                            out.print("Feminino");
                                                            break;
                                                        case "O":
                                                            out.print("Outro");
                                                            break;
                                                        default:
                                                            out.print("Selecione um estado civil");
                                                    }
                                                %>
                                            </option>
                                            <option value="M" <%= sexo.equals("M") ? "hidden" : ""%>>Masculino</option>
                                            <option value="F" <%= sexo.equals("F") ? "hidden" : ""%>>Feminino</option>
                                            <option value="O" <%= sexo.equals("O") ? "hidden" : ""%>>Outro</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="rg" class="col-form-label">RG</label>
                                        <input value="<%=rg%>" type="text" class="form-control" id="rg" name="rg" placeholder="Digite o RG">
                                        <span id="rg-invalid" class="invalid-feedback">RG inválido!</span>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="orgaoExpedidor" class="col-form-label">Órgão Expedidor</label>
                                        <select id="orgaoExpedidor" name="orgaoExpedidor" class="form-select" aria-label="Órgão Expedidor">
                                            <option value="" <%= orgaoExpedidor.isEmpty() ? "disabled hidden" : ""%>>
                                                <%
                                                    switch (orgaoExpedidor) {
                                                        case "SSP":
                                                            out.print("Secretaria de Segurança Pública");
                                                            break;
                                                        case "PM":
                                                            out.print("Polícia Militar");
                                                            break;
                                                        case "PC":
                                                            out.print("Polícia Civil");
                                                            break;
                                                        case "CNT":
                                                            out.print("Carteira Nacional de Habilitação");
                                                            break;
                                                        case "IFP":
                                                            out.print("Instituto Félix Pacheco");
                                                            break;
                                                        case "DIC":
                                                            out.print("Diretoria de Identificação Civil");
                                                            break;
                                                        case "CTPS":
                                                            out.print("Carteira de Trabalho e Previdência Social");
                                                            break;
                                                        case "DPF":
                                                            out.print("Departamento de Polícia Federal");
                                                            break;
                                                        case "MAE":
                                                            out.print("Ministério da Aeronáutica");
                                                            break;
                                                        case "MEX":
                                                            out.print("Ministério do Exército");
                                                            break;
                                                        case "MMA":
                                                            out.print("Ministério da Marinha");
                                                            break;
                                                        case "SEAP":
                                                            out.print("Secretaria de Administração Penitenciária");
                                                            break;
                                                        default:
                                                            out.print("Selecione um órgão expedidor");
                                                    }
                                                %>
                                            </option>
                                            <option value="SSP" <%= orgaoExpedidor.equals("SSP") ? "hidden" : ""%>>Secretaria de Segurança Pública</option>
                                            <option value="PM" <%= orgaoExpedidor.equals("PM") ? "hidden" : ""%>>Polícia Militar</option>
                                            <option value="PC" <%= orgaoExpedidor.equals("PC") ? "hidden" : ""%>>Polícia Civil</option>
                                            <option value="CNT" <%= orgaoExpedidor.equals("CNT") ? "hidden" : ""%>>Carteira Nacional de Habilitação</option>
                                            <option value="IFP" <%= orgaoExpedidor.equals("IFP") ? "hidden" : ""%>>Instituto Félix Pacheco</option>
                                            <option value="DIC" <%= orgaoExpedidor.equals("DIC") ? "hidden" : ""%>>Diretoria de Identificação Civil</option>
                                            <option value="CTPS" <%= orgaoExpedidor.equals("CTPS") ? "hidden" : ""%>>Carteira de Trabalho e Previdência Social</option>
                                            <option value="DPF" <%= orgaoExpedidor.equals("DPF") ? "hidden" : ""%>>Departamento de Polícia Federal</option>
                                            <option value="MAE" <%= orgaoExpedidor.equals("MAE") ? "hidden" : ""%>>Ministério da Aeronáutica</option>
                                            <option value="MEX" <%= orgaoExpedidor.equals("MEX") ? "hidden" : ""%>>Ministério do Exército</option>
                                            <option value="MMA" <%= orgaoExpedidor.equals("MMA") ? "hidden" : ""%>>Ministério da Marinha</option>
                                            <option value="SEAP" <%= orgaoExpedidor.equals("SEAP") ? "hidden" : ""%>>Secretaria de Administração Penitenciária</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="dataEmissao" class="col-form-label">Data de Emissão</label>
                                        <input value="<%=dataEmissao%>" type="date" class="form-control" id="dataEmissao" name="dataEmissao">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="cpf" class="col-form-label">CPF</label>
                                        <input value="<%=cpf%>" type="text" class="form-control" id="cpf" name="cpf" placeholder="Digite o CPF">
                                        <span id="cpf-invalid" class="invalid-feedback">CPF inválido!</span>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="cep" class="col-form-label">CEP</label>
                                        <input value="<%=cep%>" type="text" class="form-control" id="cep" name="cep" placeholder="Digite o CEP">
                                        <span id="cep-invalid" class="invalid-feedback">CEP inválido!</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-8">
                                        <label for="cidade" class="col-form-label">Cidade</label>
                                        <input value="<%=cidade%>" type="text" class="form-control" id="cidade" name="cidade" placeholder="Digite a cidade">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="estado" class="col-form-label">Estado</label>
                                        <input value="<%=estado%>" type="text" class="form-control" id="estado" name="estado" placeholder="Digite o estado" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-10">
                                        <label for="rua" class="col-form-label">Rua</label>
                                        <input value="<%=rua%>" type="text" class="form-control" id="rua" name="rua" placeholder="Digite a rua">
                                    </div>
                                    <div class="col-md-2">
                                        <label for="numero" class="col-form-label">Número</label>
                                        <input value="<%=numero%>" type="number" class="form-control" id="numero" name="numero" placeholder="Digite o numero">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-5">
                                        <label for="bairro" class="col-form-label">Bairro</label>
                                        <input value="<%=bairro%>" type="text" class="form-control" id="bairro" name="bairro" placeholder="Digite o bairro">
                                    </div>
                                    <div class="col-md-7">
                                        <label for="complemento" class="col-form-label">Complemento</label>
                                        <input value="<%=complemento%>" type="text" class="form-control" id="complemento" name="complemento" placeholder="Digite o complemento">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="fone" class="col-form-label">Celular</label>
                                        <input value="<%=fone%>" type="text" class="form-control" id="fone" name="fone" placeholder="Digite o celular">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="telefone" class="col-form-label">Telefone</label>
                                        <input value="<%=telefone%>" type="text" class="form-control" id="telefone" name="telefone" placeholder="Digite o telefone">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="email" class="col-form-label">Email</label>
                                        <input value="<%=email%>" type="email" class="form-control" id="email" name="email" placeholder="Digite o email">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="estadoNatu" class="col-form-label">Estado de Naturalidade</label>
                                        <select id="estadoNatu" name="estadoNatu" class="form-select">
                                            <!-- BUSCAGEM DE DADOS DE TABELAS NO SELECT -->
                                            <%
                                                String nomeEstadoNatu = "";
                                                String ufEstadoNatu = "";
                                                //RECUPERAR O NOME DO CAMPO PARA MOSTRAR INICIALMENTE NO SELECT
                                                if (!estadoNatu.equals("")) {
                                                    rs = st.executeQuery("SELECT * FROM estado WHERE uf = '" + estadoNatu + "'");
                                                    while (rs.next()) {
                                                        ufEstadoNatu = rs.getString(2);
                                                    }
                                                    out.println("<option value='" + estadoNatu + "'>" + ufEstadoNatu + "</option>");
                                                }
                                                st = new Conexao().conectar().createStatement();
                                                rs = st.executeQuery("SELECT * FROM estado");

                                                while (rs.next()) {
                                                    if (!nomeEstadoNatu.equals(rs.getString(2))) {
                                                        out.println("<option value='" + rs.getString(3) + "'>" + rs.getString(2) + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="cidadeNatu" class="col-form-label">Cidade de Naturalidade</label>
                                        <input value="<%=cidadeNatu%>" type="text" class="form-control" id="cidadeNatu" name="cidadeNatu" placeholder="Digite a cidade">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="filiacao1" class="col-form-label">Filiação 1</label>
                                        <input value="<%=filiacao1%>" type="text" class="form-control" id="filiacao1" name="filiacao1" placeholder="Informe a filiação">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="filiacao2" class="col-form-label">Filiação 2</label>
                                        <input value="<%=filiacao2%>" type="text" class="form-control" id="filiacao2" name="filiacao2" placeholder="Informe a filiação">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="nomeSocial" class="col-form-label">Nome Social</label>
                                        <input value="<%=nomeSocial%>" type="text" class="form-control" id="nomeSocial" name="nomeSocial" placeholder="Digite o nome social">
                                        <span id="nomeSocial-invalid" class="invalid-feedback">Apenas se houver um!</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="pisPasep" class="col-form-label">PIS/PASEP</label>
                                        <input value="<%=pisPasep%>" type="text" class="form-control" id="pisPasep" name="pisPasep" placeholder="Informe o PIS/PASEP">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="tituloEleitor" class="col-form-label">Título de Eleitor</label>
                                        <input value="<%=tituloEleitor%>" type="text" class="form-control" id="tituloEleitor" name="tituloEleitor" placeholder="Informe o número do título">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="zonaEleitor" class="col-form-label">Zona do Eleitor</label>
                                        <input value="<%=zonaEleitor%>" type="text" class="form-control" id="zonaEleitor" name="zonaEleitor" placeholder="Digite a zona">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="secaoEleitor" class="col-form-label">Seção do Eleitor</label>
                                        <input value="<%=secaoEleitor%>" type="text" class="form-control" id="secaoEleitor" name="secaoEleitor" placeholder="Digite a seção">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="regimeCasamento" class="col-form-label">Regime do Casamento</label>
                                        <input value="<%=regimeCasamento%>" type="text" class="form-control" id="regimeCasamento" name="regimeCasamento" placeholder="Informe o regime do casamento">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="conjuge" class="col-form-label">Nome do Cônjuge</label>
                                        <input value="<%=conjuge%>" type="text" class="form-control" id="conjuge" name="conjuge" placeholder="Digite o nome do cônjuge">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="numeroCasamento" class="col-form-label">Número do Casamento</label>
                                        <input value="<%=numeroCasamento%>" type="text" class="form-control" id="numeroCasamento" name="numeroCasamento" placeholder="Digite o número">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="folhaCasamento" class="col-form-label">Folha do Casamento</label>
                                        <input value="<%=folhaCasamento%>" type="text" class="form-control" id="folhaCasamento" name="folhaCasamento" placeholder="Digite a folha">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="termoCasamento" class="col-form-label">Termo do Casamento</label>
                                        <input value="<%=termoCasamento%>" type="text" class="form-control" id="termoCasamento" name="termoCasamento" placeholder="Digite o termo">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="cartorioCasamento" class="col-form-label">Cartório do Casamento</label>
                                        <input value="<%=cartorioCasamento%>" type="text" class="form-control" id="cartorioCasamento" name="cartorioCasamento" placeholder="Informe o cartório">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="cidadeCasamento" class="col-form-label">Cidade do Casamento</label>
                                        <input value="<%=cidadeCasamento%>" type="text" class="form-control" id="cidadeCasamento" name="cidadeCasamento" placeholder="Informe a cidade">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="estadoCasamento" class="col-form-label">Estado do Casamento</label>
                                        <select id="estadoCasamento" name="estadoCasamento" class="form-select">
                                            <!-- BUSCAGEM DE DADOS DE TABELAS NO SELECT -->
                                            <%
                                                String nomeEstadoCasamento = "";
                                                String ufEstadoCasamento = "";
                                                //RECUPERAR O NOME DO CAMPO PARA MOSTRAR INICIALMENTE NO SELECT
                                                if (!estadoCasamento.equals("")) {
                                                    rs = st.executeQuery("SELECT * FROM estado WHERE uf = '" + estadoCasamento + "'");
                                                    while (rs.next()) {
                                                        ufEstadoCasamento = rs.getString(2);
                                                    }
                                                    out.println("<option value='" + estadoCasamento + "'>" + ufEstadoCasamento + "</option>");
                                                }
                                                st = new Conexao().conectar().createStatement();
                                                rs = st.executeQuery("SELECT * FROM estado");

                                                while (rs.next()) {
                                                    if (!nomeEstadoCasamento.equals(rs.getString(2))) {
                                                        out.println("<option value='" + rs.getString(3) + "'>" + rs.getString(2) + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="estadoNatu" class="col-form-label">Número do Nascimento</label>
                                        <input value="<%=numeroNascimento%>" type="text" class="form-control" id="numeroNascimento" name="numeroNascimento" placeholder="Digite o número">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="folhaNascimento" class="col-form-label">Folha do Nascimento</label>
                                        <input value="<%=folhaNascimento%>" type="text" class="form-control" id="folhaNascimento" name="folhaNascimento" placeholder="Digite a folha">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="termoNascimento" class="col-form-label">Termo do Nascimento</label>
                                        <input value="<%=termoNascimento%>" type="text" class="form-control" id="termoNascimento" name="termoNascimento" placeholder="Digite o termo">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="cartorioNascimento" class="col-form-label">Cartório do Nascimento</label>
                                        <input value="<%=cartorioNascimento%>" type="text" class="form-control" id="cartorioNascimento" name="cartorioNascimento" placeholder="Informe o cartório">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="cidadeNascimento" class="col-form-label">Cidade do Nascimento</label>
                                        <input value="<%=cidadeNascimento%>" type="text" class="form-control" id="cidadeNascimento" name="cidadeNascimento" placeholder="Informe a cidade">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="estadoNascimento" class="col-form-label">Estado do Nascimento</label>
                                        <select id="estadoNascimento" name="estadoNascimento" class="form-select">
                                            <!-- BUSCAGEM DE DADOS DE TABELAS NO SELECT -->
                                            <%
                                                String nomeEstadoNascimento = "";
                                                String ufEstadoNascimento = "";
                                                //RECUPERAR O NOME DO CAMPO PARA MOSTRAR INICIALMENTE NO SELECT
                                                if (!estadoNascimento.equals("")) {
                                                    rs = st.executeQuery("SELECT * FROM estado WHERE uf = '" + estadoNascimento + "'");
                                                    while (rs.next()) {
                                                        ufEstadoNascimento = rs.getString(2);
                                                    }
                                                    out.println("<option value='" + estadoNascimento + "'>" + ufEstadoNascimento + "</option>");
                                                }
                                                st = new Conexao().conectar().createStatement();
                                                rs = st.executeQuery("SELECT * FROM estado");

                                                while (rs.next()) {
                                                    if (!nomeEstadoNascimento.equals(rs.getString(2))) {
                                                        out.println("<option value='" + rs.getString(3) + "'>" + rs.getString(2) + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="outros" class="col-form-label">Outros Documentos</label>
                                        <input type="file" class="form-control" id="outros" name="outros">
                                    </div>
                                </div>
                            </div>
                            <input value="<%=id%>" type="hidden" name="txtid" id="txtid">
                            <input value="<%=cpf%>" type="hidden" name="antigo" id="antigo">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" id="btn-fechar" name="btn-fechar" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" id="btn-salvar" name="btn-salvar">Salvar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- MODAL CONFIRMA DELETAR REGISTRO -->
        <div class="modal fade" id="modal-confima-delete" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <input type="hidden" id="id-del">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Deletar</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Deseja realmente excluir o registro selecionado?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="btn-cancelar" name="btn-cancelar" data-bs-dismiss="modal">Não</button>
                        <button type="button" class="btn btn-danger" id="btn-confirma-excluir" name="btn-confirma-excluir">Sim</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- FUNÇÃO PARA MODAL EDITAR -->
        <%
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("novo")) {
                out.println("<script>$(document).ready(function () {$('#cadastrarPessoaModal').modal('show');});</script>");
            }
        %>
        <!-- FUNÇÃO PARA MODAL EDITAR -->

        <!-- FUNÇÃO PARA MODAL EDITAR -->
        <%
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                out.println("<script>$(document).ready(function () {$('#cadastrarPessoaModal').modal('show');});</script>");
            }
        %>
        <!-- FUNÇÃO PARA MODAL EDITAR -->

        <!-- FUNÇÃO PARA MODAL EXCLUIR -->
        <%
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
                out.println("<script>$(document).ready(function () {$('#modal-confima-delete').modal('show');});</script>");
            }
        %>
        <!-- FUNÇÃO PARA MODAL EXCLUIR -->

        <script src="<%= request.getContextPath()%>/js/cadastros/jquery-3.7.1.min.js"></script>
        <script>
            // AJAX PARA INSERSÃO DE DADOS SEM IMAGEM
            $(document).ready(function () {
                $('#btn-salvar').click(function (event) {
                    event.preventDefault();
                    $.ajax({
                        url: "<%= request.getContextPath()%>/ajax/<%=pag%>/inserir.jsp",
                        method: "post",
                        data: $('#fc').serialize(),
                        dataType: "text",
                        success: function (mensagem) {
                            $('#mensagem').removeClass();
                            if (mensagem.trim() === "Salvo") {
                                function showPopupSuccess(message) {
                                    var popup = document.createElement('div');
                                    popup.className = 'alert alert-success';
                                    popup.innerHTML = '<div class="alert alert-success" role="alert">' + message + '</div>';
                                    document.body.appendChild(popup);
                                    setTimeout(function () {
                                        popup.style.opacity = '0';
                                        setTimeout(function () {
                                            popup.remove();
                                        }, 300);
                                    }, 5000);
                                }
                                $('#btn-fechar').click();
                                $('#btn-buscar').click();
                                const newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
                                window.history.replaceState({path: newUrl}, '', newUrl);
                                showPopupSuccess('Cadastrado Com Sucesso!');
                            } else if (mensagem.trim() === "Duplo") {
                                function showPopup(message) {
                                    var popup = document.createElement('div');
                                    popup.className = 'alert alert-danger';
                                    popup.innerHTML = '<div class="alert alert-danger" role="alert">' + message + '</div>';
                                    document.body.appendChild(popup);
                                    setTimeout(function () {
                                        popup.style.opacity = '0';
                                        setTimeout(function () {
                                            popup.remove();
                                        }, 300);
                                    }, 5000);
                                }
                                const newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
                                window.history.replaceState({path: newUrl}, '', newUrl);
                                showPopup('Registro já cadastrado!');
                            } else if (mensagem.trim() === "Preencha") {
                                function showPopup(message) {
                                    var popup = document.createElement('div');
                                    popup.className = 'alert alert-danger';
                                    popup.innerHTML = '<div class="alert alert-danger" role="alert">' + message + '</div>';
                                    document.body.appendChild(popup);
                                    setTimeout(function () {
                                        popup.style.opacity = '0';
                                        setTimeout(function () {
                                            popup.remove();
                                        }, 300);
                                    }, 5000);
                                }
                                const newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
                                window.history.replaceState({path: newUrl}, '', newUrl);
                                showPopup('Preencha Todos os Campos!');
                            } else {
                                function showPopup(message) {
                                    var popup = document.createElement('div');
                                    popup.className = 'alert alert-danger';
                                    popup.innerHTML = '<div class="alert alert-danger" role="alert">' + message + '</div>';
                                    document.body.appendChild(popup);
                                    setTimeout(function () {
                                        popup.style.opacity = '0';
                                        setTimeout(function () {
                                            popup.remove();
                                        }, 300);
                                    }, 5000);
                                }
                                $('#btn-fechar').click();
                                const newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
                                window.history.replaceState({path: newUrl}, '', newUrl);
                                showPopup('Erro ao Cadastrar!');
                            }
                            $('#mensagem').text(mensagem);
                        }
                    });
                });
            });

            // AJAX PARA LISTAR OS DADOS
            $(document).ready(function () {
                $.ajax({
                    url: "<%= request.getContextPath()%>/ajax/<%=pag%>/listar.jsp",
                    method: "post",
                    dataType: "html",
                    success: function (result) {
                        $('#listar').html(result);
                    },
                    error: function (xhr, status, error) {
                        console.error("Erro na requisição AJAX:", status, error);
                        $('#listar').html("<p>Erro ao carregar listagem.</p>");
                    }
                });
            });

            // AJAX PARA BUSCAR DADOS PELO BOTÃO
            $('#btn-buscar').click(function (event) {
                event.preventDefault();
                $.ajax({
                    url: "<%= request.getContextPath()%>/ajax/<%=pag%>/listar.jsp",
                    method: "post",
                    data: $('form').serialize(),
                    dataType: "html",
                    success: function (result) {
                        $('#listar').html(result);
                    }
                });
            });

            // AJAX PARA BUSCAR DADOS PELO TXT 
            $('#buscar').keyup(function () {
                $('#btn-buscar').click();
            });

            // AJAX PARA EXCLUSÃO DOS DADOS 
            $(document).ready(function () {
                $('#btn-confirma-excluir').click(function (event) {
                    event.preventDefault();
                    $.ajax({
                        url: "<%= request.getContextPath()%>/ajax/<%=pag%>/excluir.jsp",
                        method: "post",
                        data: $('form').serialize(),
                        dataType: "text",
                        success: function (mensagem) {
                            if (mensagem.trim() === 'Excluido') {
                                function showPopup(message) {
                                    var popup = document.createElement('div');
                                    popup.className = 'alert alert-success';
                                    popup.innerHTML = '<div class="alert alert-success" role="alert">' + message + '</div>';
                                    document.body.appendChild(popup);
                                    setTimeout(function () {
                                        popup.style.opacity = '0';
                                        setTimeout(function () {
                                            popup.remove();
                                        }, 300);
                                    }, 5000);
                                    const newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
                                    window.history.replaceState({path: newUrl}, '', newUrl);
                                }

                                showPopup('Excluído com Sucesso!');
                                $('#buscar').val('');
                                $('#btn-buscar').click();
                                $('#modal-confima-delete').modal('hide');
                            }
                        }
                    });
                });
            });

            // VALIDAÇÃO DE CPF E CEP E RG
            $(document).ready(function () {
                function aplicarMascara() {
                    $("#cep").on("input", function () {
                        let value = $(this).val().replace(/\D/g, "").slice(0, 8);
                        if (value.length > 5) {
                            value = value.replace(/^(\d{5})(\d)/, "$1-$2");
                        }
                        $(this).val(value);
                    });

                    $("#cpf").on("input", function () {
                        let value = $(this).val().replace(/\D/g, "").slice(0, 11);
                        if (value.length > 9) {
                            value = value.replace(/^(\d{3})(\d{3})(\d{3})(\d{2})/, "$1.$2.$3-$4");
                        } else if (value.length > 6) {
                            value = value.replace(/^(\d{3})(\d{3})(\d{3})/, "$1.$2.$3");
                        } else if (value.length > 3) {
                            value = value.replace(/^(\d{3})(\d{3})/, "$1.$2");
                        }
                        $(this).val(value);
                    });

                    $("#fone").on("input", function () {
                        let value = $(this).val().replace(/\D/g, "").slice(0, 11);
                        if (value.length === 11) {
                            value = value.replace(/^(\d{2})(\d{5})(\d{4})/, "($1) $2-$3");
                        } else if (value.length === 10) {
                            value = value.replace(/^(\d{2})(\d{4})(\d{4})/, "($1) $2-$3");
                        }
                        $(this).val(value);
                    });

                    $("#telefone").on("input", function () {
                        let value = $(this).val().replace(/\D/g, "").slice(0, 10);
                        if (value.length > 6) {
                            value = value.replace(/^(\d{2})(\d{4})(\d{4})/, "($1) $2-$3");
                        } else if (value.length > 2) {
                            value = value.replace(/^(\d{2})(\d{4})/, "($1) $2");
                        }
                        $(this).val(value);
                    });

                    $("#rg").on("input", function () {
                        let value = $(this).val().replace(/\D/g, "").slice(0, 9);
                        if (value.length > 7) {
                            value = value.replace(/^(\d{2})(\d{3})(\d{3})(\d{1})/, "$1.$2.$3-$4");
                        } else if (value.length > 4) {
                            value = value.replace(/^(\d{2})(\d{3})(\d{3})/, "$1.$2.$3");
                        } else if (value.length > 2) {
                            value = value.replace(/^(\d{2})(\d{3})/, "$1.$2");
                        }
                        $(this).val(value);
                    });
                }

                aplicarMascara();

                function validarRG(rg) {
                    rg = rg.replace(/\D/g, "");
                    return rg.length === 9;
                }

                $('#rg').blur(function () {
                    let rg = $(this).val();
                    if (!validarRG(rg)) {
                        $(this).addClass('is-invalid').removeClass('is-valid');
                        $('#rg-invalid').show();
                    } else {
                        $(this).removeClass('is-invalid').addClass('is-valid');
                        $('#rg-invalid').hide();
                    }
                });

                function validarCPF(cpf) {
                    cpf = cpf.replace(/\D/g, "");

                    if (cpf.length !== 11 || /^(\d)\1+$/.test(cpf)) {
                        return false;
                    }

                    let soma = 0, resto;
                    for (let i = 1; i <= 9; i++) {
                        soma += parseInt(cpf[i - 1]) * (11 - i);
                    }
                    resto = (soma * 10) % 11;
                    if (resto === 10 || resto === 11)
                        resto = 0;
                    if (resto !== parseInt(cpf[9]))
                        return false;

                    soma = 0;
                    for (let i = 1; i <= 10; i++) {
                        soma += parseInt(cpf[i - 1]) * (12 - i);
                    }
                    resto = (soma * 10) % 11;
                    if (resto === 10 || resto === 11)
                        resto = 0;
                    if (resto !== parseInt(cpf[10]))
                        return false;

                    return true;
                }

                $('#cpf').blur(function () {
                    let cpf = $(this).val().replace(/\D/g, '');
                    if (!validarCPF(cpf)) {
                        $(this).addClass('is-invalid').removeClass('is-valid');
                        $('#cpf-invalid').show();
                    } else {
                        $(this).removeClass('is-invalid').addClass('is-valid');
                        $('#cpf-invalid').hide();
                    }
                });

                $('#cep').blur(function () {
                    var vl = this.value;
                    $.get('https://viacep.com.br/ws/' + vl + '/json/', function (dados) {
                        if (!dados.erro) {
                            $('#rua').val(dados.logradouro);
                            $('#bairro').val(dados.bairro);
                            $('#cidade').val(dados.localidade);
                            $('#estado').val(dados.uf);

                            $('#cep').removeClass('is-invalid').addClass('is-valid');
                            $('#cep-invalid').hide();
                        } else {
                            $('#cep').addClass('is-invalid').removeClass('is-valid');
                            $('#cep-invalid').show();
                        }
                    }).fail(function () {
                        $('#cep').addClass('is-invalid').removeClass('is-valid');
                        $('#cep-invalid').show();
                    });
                });
            });

            // SPAN NO CAMPO DE NOME SOCIAL
            $(document).ready(function () {
                $("#nomeSocial").focus(function () {
                    $("#nomeSocial-invalid").show();
                });

                $("#nomeSocial").blur(function () {
                    if ($(this).val().trim() !== "") {
                        $("#nomeSocial-invalid").hide();
                    }
                });
            });
        </script>
    </body>
</html>
