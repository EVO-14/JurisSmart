<%@ include file="../template/_cabecalho.jsp" %>
<%@ include file="../template/_lateral.jsp" %>

<% String pag = "cadastroProdutividade";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>| JurisSmart - Produtividade |</title>
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

            .modalCadastrarProdutividade {
                margin-top: 80px;
            }

            .modalCadastrarProdutividade .modal-body {
                max-height: calc(80vh - 120px);
                overflow-y: auto;
            }

            .modalCadastrarProdutividade .input-file {
                text-align: center;
            }

            .modalCadastrarProdutividade .input-file img {
                max-height: 150px;
            }

            .modalCadastrarProdutividade .modal-body input::placeholder {
                color: rgba(0, 0, 0, 0.3);
            }

            .modalCadastrarProdutividade .image-label {
                background-color: rgb(19, 125, 247);
                color: white;
                width: 100%;
                height: 30px;
                text-align: center;
                cursor: pointer;
                border: none;
                border-radius: 5px;
                margin-top: 15px;
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
        </style>
    </head>

    <body>
        <main id="main">
            <div class="search">
                <div class="search-left">
                    <form method="post" id="search" class="search">
                        <button type="submit" id="btn-buscar" name="btn-buscar" title="[Consultar Produtividade]">
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

        <div class="modal fade modalCadastrarProdutividade" id="cadastrarProdutividadeModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-xl">
                <div class="modal-content modal-content-scrollable">
                    <div class="modal-header">
                        <%
                            String titulo = "";
                            String id = "";
                            if (request.getParameter("id") != null) {
                                titulo = "Editar Produtividade";
                                id = request.getParameter("id");
                                try {
                                    st = new Conexao().conectar().createStatement();
                                    rs = st.executeQuery("SELECT * FROM produtividade WHERE id = '" + id + "'");
                                    while (rs.next()) {
                                        
                                    }
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            } else {
                                titulo = "Cadastrar Produtividade";
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
                            
                            <input value="<%=id%>" type="hidden" name="txtid" id="txtid">
                            <input value="" type="hidden" name="antigo" id="antigo">
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
                        <button type="button" class="btn btn-secondary" id="btn-fechar" name="btn-fechar" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary" id="btn-salvar" name="btn-salvar">Salvar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- FUNÇÃO PARA MODAL INSERIR -->
        <%
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("novo")) {
                out.println("<script>$(document).ready(function () {$('#cadastrarProdutividadeModal').modal('show');});</script>");
            }
        %>
        <!-- FUNÇÃO PARA MODAL INSERIR -->

        <!-- FUNÇÃO PARA MODAL EDITAR -->
        <%
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                out.println("<script>$(document).ready(function () {$('#cadastrarProdutividadeModal').modal('show');});</script>");
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

        <script>
            //SCRIPT PARA SUBIR IMAGEM PARA O SERVIDOR -->
            function carregarImg() {
                var file = document.getElementById("fotoPerfil");
                var target = document.getElementById("target");
                var reader = new FileReader();
                reader.onloadend = function () {
                    target.src = reader.result;
                };
                if (file.files[0]) {
                    reader.readAsDataURL(file.files[0]);
                } else {
                    target.src = "";
                }
            }

            // AJAX PARA INSERSÃO DE DADOS COM IMAGEM
            $("#fc").submit(function () {
                event.preventDefault();
                var formData = new FormData(this);
                $.ajax({
                    url: "<%= request.getContextPath()%>/ajax/<%=pag%>/upload.jsp",
                    type: 'POST',
                    data: formData,
                    success: function (mensagem) {
                        $('#mensagem').removeClass();
                        if (mensagem.trim() === "Salvo") {
                            function showPopupSuccess(message) {
                                var popup = document.createElement('div');
                                popup.className = 'alert alert-success';
                                popup.innerHTML = '<div class="alert alert-success">' + message + '</div>';
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
                            $('#btn-fechar').click();
                            $('#btn-buscar').click();
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
                            showPopup('Preencha Todos os Campos');
                        } else if (mensagem.trim() === "Diferente") {
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
                            showPopup('As Senhas Não Conferem!');
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
                            $('#btn-buscar').click();
                            showPopup('Erro ao Cadastrar!');
                        }
                        $('#mensagem').text(mensagem);
                    },
                    cache: false,
                    contentType: false,
                    processData: false,
                    xhr: function () {  // Custom XMLHttpRequest
                        var myXhr = $.ajaxSettings.xhr();
                        if (myXhr.upload) { // Avalia se tem suporte a propriedade upload
                            myXhr.upload.addEventListener('progress', function () {
                                /* faz alguma coisa durante o progresso do upload */
                            }, false);
                        }
                        return myXhr;
                    }
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
                                    // Remover o produtividade funcao da URL sem recarregar a página
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
            $(document).ready(function () {
                function aplicarMascara() {
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
                }

                aplicarMascara();
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
            });

            $(document).ready(function () {
                $('#confirmSenha').on('blur', function () {
                    let senha = $('#senha').val();
                    let confirmSenha = $('#confirmSenha').val();
                    if (senha !== confirmSenha) {
                        $('#senha, #confirmSenha').removeClass('is-valid').addClass('is-invalid');
                        $('#senha-error').show();
                    } else {
                        $('#senha, #confirmSenha').removeClass('is-invalid').addClass('is-valid');
                        $('#senha-error').hide();
                    }
                });
            });
        </script>
    </body>
</html>
