<%@ include file="../template/_cabecalho.jsp" %>
<%@ include file="../template/_lateral.jsp" %>

<% String pag = "cadastroUsuario";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>| JurisSmart |</title>
        <style>
            main img {
                width: 50px;
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

            .container th {
                text-align: center;
                border-right: 15px solid var(--background-color);
                border-left: 15px solid var(--background-color);
                font-weight: bold;
                font-size: 80%;
            }

            .container .cell {
                text-align: left;
                background-color: var (--border-color);
                border-bottom: 15px solid var(--background-color);
                border-right: 15px solid var(--background-color);
                border-left: 15px solid var(--background-color);
                border-top: 5px solid var(--background-color);
                color: var(--text-color1);
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
            
            .modalCadastrarUsuario {
                margin-top: 80px;
            }

            .modalCadastrarUsuario .modal-body {
                max-height: calc(80vh - 120px);
                overflow-y: auto;
            }
        </style>
    </head>

    <body>
        <main id="main">
            <div class="search">
                <div class="search-left">
                    <form method="post" id="search" class="search">
                        <button type="submit" id="btn-buscar" name="btn-buscar" title="[Consultar Usuário]">
                            <img src="<%= request.getContextPath()%>/imagens/icons/cadastro/search-alt-2-svgrepo-com.svg" alt="[Buscar]">
                        </button>
                        <input type="search" name="buscar" id="buscar" placeholder="Buscar pelo nome" class="form-control">
                    </form>
                </div>
                <div class="search-right">
                    <a href="<%=pag%>.jsp?funcao=novo" id="bt-novo-cad-cargo" title="[Adicionar Novo]">
                        <img src="<%= request.getContextPath()%>/imagens/icons/cadastro/plus-square-svgrepo-com.svg" alt="[Adicionar Novo]">
                    </a>
                </div>
            </div>
            <div class="container">
                <div id="listar" class="listar"></div>
                <div id="mensagem"></div>
            </div>
        </main>

        <div class="modal fade modalCadastrarUsuario" id="cadastrarUsuarioModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-xl">
                <div class="modal-content modal-content-scrollable">
                    <div class="modal-header">
                        <%
                            String titulo = "";
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
                            String fotoPerfil = "";
                            String observacoes = "";
                            String id = "";
                            if (request.getParameter("id") != null) {
                                titulo = "Editar Usuario";
                                id = request.getParameter("id");
                                try {
                                    st = new Conexao().conectar().createStatement();
                                    rs = st.executeQuery("SELECT * FROM usuario WHERE id = '" + id + "'");
                                    while (rs.next()) {
                                        nome = rs.getString(2);
                                        email = rs.getString(3);
                                        fone = rs.getString(4);
                                        cpf = rs.getString(5);
                                        dataNasc = rs.getString(6);
                                        funcao = rs.getString(7);
                                        senha = rs.getString(8);
                                        permissao = rs.getString(9);
                                        departamento = rs.getString(10);
                                        dataAdmissao = rs.getString(11);
                                        status = rs.getString(12);
                                        fotoPerfil = rs.getString(13);
                                        observacoes = rs.getString(14);
                                    }
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            } else {
                                titulo = "Cadastrar Usuario";
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
                                    <div class="col-md-12">
                                        <label for="nome" class="col-form-label">Nome</label>
                                        <input value="<%=nome%>" type="text" class="form-control" id="nome" name="nome" placeholder="Digite aqui o nome do usuário" maxlength="255">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="email" class="col-form-label">E-mail</label>
                                        <input value="<%=email%>" type="text" class="form-control" id="email" name="email" placeholder="Digite aqui o email do usuário" maxlength="255">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="fone" class="col-form-label">Telefone</label>
                                        <input value="<%=fone%>" type="text" class="form-control" id="fone" name="fone" placeholder="Digite aqui o número do usuário" maxlength="255">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="cpf" class="col-form-label">CPF</label>
                                        <input value="<%=cpf%>" type="text" class="form-control" id="cpf" name="cpf" placeholder="Digite aqui o cpf do usuário" maxlength="255">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="dataNasc" class="col-form-label">Data de Nascimento</label>
                                        <input value="<%=dataNasc%>" type="date" class="form-control" id="dataNasc" name="dataNasc" placeholder="Digite aqui a data de nascimento do usuário">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="funcao" class="col-form-label">Função</label>
                                        <input value="<%=funcao%>" type="text" class="form-control" id="funcao" name="funcao" placeholder="Digite aqui a função do usuário">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="senha" class="col-form-label">Senha</label>
                                        <input value="<%=senha%>" type="password" class="form-control" id="senha" name="senha" placeholder="Digite aqui a senha do usuário" maxlength="255">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="permissao" class="col-form-label">Permissão</label>
                                        <input value="<%=permissao%>" type="text" class="form-control" id="permissao" name="permissao" placeholder="Digite aqui a permissão do usuário">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="departamento" class="col-form-label">Departamento</label>
                                        <input value="<%=departamento%>" type="text" class="form-control" id="departamento" name="departamento" placeholder="Digite aqui o departamento do usuário">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="dataAdmissao" class="col-form-label">Data de Admissao</label>
                                        <input value="<%=dataAdmissao%>" type="text" class="form-control" id="dataAdmissao" name="dataAdmissao" placeholder="Digite aqui a data de admissão do usuário">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="status" class="col-form-label">Descrição</label>
                                        <input value="<%=status%>" type="text" class="form-control" id="status" name="status" placeholder="Digite aqui o status do usuário">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="fotoPerfil" class="col-form-label">Descrição</label>
                                        <input value="<%=fotoPerfil%>" type="text" class="form-control" id="fotoPerfil" name="fotoPerfil" maxlength="255">
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <label for="observacoes" class="col-form-label">Descrição</label>
                                        <input value="<%=observacoes%>" type="text" class="form-control" id="observacoes" name="observacoes" placeholder="Digite aqui as observações do usuário" maxlength="500">
                                    </div>
                                </div>
                            </div>
                            <input value="<%=id%>" type="hidden" name="txtid" id="txtid">
                            <input value="<%=nome%>" type="hidden" name="antigo" id="antigo">
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

        <!-- FUNÇÃO PARA MODAL CADASTRAR -->
        <%
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("novo")) {
                out.println("<script>$(document).ready(function () {$('#cadastrarUsuarioModal').modal('show');});</script>");
            }
        %>
        <!-- FUNÇÃO PARA MODAL CADASTRAR -->

        <!-- FUNÇÃO PARA MODAL EDITAR -->
        <%
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                out.println("<script>$(document).ready(function () {$('#cadastrarUsuarioModal').modal('show');});</script>");
            }
        %>
        <!-- FUNÇÃO PARA MODAL EDITAR -->

        <!-- FUNÇÃO PARA MODAL EXCLUIR -->
        <%
            if (request.getParameter(
                    "funcao") != null && request.getParameter("funcao").equals("excluir")) {
                out.println("<script>$(document).ready(function () {$('#modal-confima-delete').modal('show');});</script>");
            }
        %>
        <!-- FUNÇÃO PARA MODAL EXCLUIR -->

        <!-- AJAX PARA INSERSÃO DE DADOS SEM IMAGEM-->
        <script type="text/javascript">
            $(document).ready(function () {
                $('#btn-salvar').click(function (event) {
                    event.preventDefault();
                    $.ajax({
                        url: "../../ajax/usuario/inserir.jsp",
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
                                showPopup('Erro ao Cadastrar!');
                            }
                            $('#mensagem').text(mensagem);
                        }
                    });
                });
            });
        </script>
        <!-- AJAX PARA INSERSÃO DE DADOS -->

        <!--AJAX PARA LISTAR OS DADOS -->
        <script type="text/javascript">
            $(document).ready(function () {
                $.ajax({
                    url: "../../ajax/usuario/listar.jsp",
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
        </script>
        <!--AJAX PARA LISTAR OS DADOS -->

        <!--AJAX PARA BUSCAR DADOS PELO BOTÃO -->
        <script type="text/javascript">
            $('#btn-buscar').click(function (event) {
                event.preventDefault();
                $.ajax({
                    url: "../../ajax/usuario/listar.jsp",
                    method: "post",
                    data: $('form').serialize(),
                    dataType: "html",
                    success: function (result) {
                        $('#listar').html(result);
                    }
                });
            });
        </script>
        <!--AJAX PARA BUSCAR DADOS PELO BOTÃO -->

        <!--AJAX PARA BUSCAR DADOS PELO TXT -->
        <script type="text/javascript">
            $('#buscar').keyup(function () {
                $('#btn-buscar').click();
            });
        </script>
        <!--AJAX PARA BUSCAR DADOS PELO TXT -->

        <!--AJAX PARA EXCLUSÃO DOS DADOS -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('#btn-confirma-excluir').click(function (event) {
                    event.preventDefault();
                    $.ajax({
                        url: "../../ajax/usuario/excluir.jsp",
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
                                    // Remover o parâmetro funcao da URL sem recarregar a página
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
        </script>
        <!--AJAX PARA EXCLUSÃO DOS DADOS -->
    </body>

</html>
