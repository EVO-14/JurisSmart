<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>| Projeto Barra Lateral |</title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../imagens/icons/home/head-gear-svgrepo-com.svg">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            /*##*/
            header {
                z-index: 200;
                width: 100%;
                display: flex;
                justify-content: space-between;
                padding: 0.45rem 2rem 0.45rem 1.27rem;
                border-bottom: 1px solid var(--border-color);
                position: fixed;
                background-color: var(--background-color);
                top: 0;
                left: 0;
            }



            /*##*/
            header>.left {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 1.4rem;
            }

            header .user {
                filter: invert(0) !important;
            }



            /*##*/
            .menu-container {
                all: unset;
                display: flex;
                align-items: center;
                cursor: pointer;
            }

            .menu {
                width: 1.5rem;
                height: 1.2rem;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                cursor: pointer;
            }

            .menu div {
                width: 100%;
                height: 0.15rem;
                background-color: var(--menu-color);
                transition: all 0.2s ease;
            }

            .menu.menu-toggle div:first-child {
                width: 40%;
                transform: rotate(-35deg) translate(-30%, 175%);
            }

            .menu.menu-toggle div:last-child {
                width: 40%;
                transform: rotate(35deg) translate(-30%, -160%);
            }



            /*##*/
            .brand {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 0.6rem;
            }

            .brand .logo {
                width: 1.7rem;
            }

            .brand .name {
                font-size: 1.5rem;
                font-weight: 900;
                color: var(--text-title-color);
            }



            /*##*/
            header>.right {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 1.6rem;
            }

            .right a {
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 0.5rem;
                transition: background-color 0.2s ease;
            }

            .right a:hover {
                background-color: var(--background-hover);
            }

            .right img {
                width: 1.5rem;
                margin: 0.5rem;
            }

            .right .user {
                width: 2.1rem;
                border-radius: 50%;
            }

            .right .dropdown {
                display: flex;
            }



            /*##*/
            .sidebar {
                margin-top: 4rem;
                width: 4rem;
                height: 100%;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 100;
                padding: 1.1rem 0;
                border-right: 1px solid var(--border-color);
                overflow-y: auto;
                background-color: var(--background-color);
                transition: width 0.5s ease;
                list-style: none;
            }

            .sidebar ul {
                margin: 0;
                padding: 0;
            }

            .sidebar ul li {
                list-style-type: none;
            }

            .sidebar.menu-toggle {
                width: 20rem;
            }

            .sidebar a {
                display: flex;
                align-items: center;
                gap: 1.3rem;
                padding: 0.9rem 0.7rem;
                text-decoration: none;
                margin: 0 0.5rem;
                border-radius: 0.5rem;
                white-space: nowrap;
                overflow: hidden;
                color: var(--text-color);
            }

            .sidebar a:hover {
                background-color: var(--background-hover);

            }

            .sidebar a.selected {
                color: var(--text-selected-color);
                background-color: var(--background-selected);
            }

            .sidebar a .arrow {
                transition: transform 0.5s ease-in-out;
            }

            .sidebar a.active .arrow {
                transform: rotate(180deg);
            }


            .sidebar img {
                width: 1.6rem;
            }

            .sidebar .down {
                width: 1.2rem;
            }

            .sidebar img,
            header img {
                filter: invert(0);
                transition: filter 0.3s ease;
            }

            .dark-mode .sidebar img,
            .dark-mode header img {
                filter: invert(1);
            }





            /*##*/
            .submenu {
                display: block;
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.5s ease-in-out, opacity 0.5s ease-in-out;
                opacity: 0;
            }

            .submenu.open {
                max-height: 1500px;
                opacity: 1;
            }

            .submenu li {
                padding-left: 15px;
                font-size: 14px;
            }

            .submenu li a {
                display: flex;
                padding: 0.5rem;
                color: var(--text-color);
                text-decoration: none;
            }

            .submenu li a:hover {
                background-color: var(--background-hover);
            }

            .submenu-item.active+.submenu {
                display: block;
            }



            /*##*/
            .sub-submenu {
                display: block;
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.5s ease-in-out, opacity 0.5s ease-in-out;
                opacity: 0;
            }

            .sub-submenu.open {
                height: 1500px;
                opacity: 1;
            }

            .sub-submenu li {
                padding-left: 15px;
                font-size: 14px;
            }

            .sub-submenu li a {
                display: block;
                padding: 0.5rem;
                color: var(--text-color);
                text-decoration: none;
            }

            .sub-submenu li a:hover {
                background-color: var(--background-hover);
            }

            .menu-item.active+.sub-submenu {
                display: block;
            }



            /*##*/
            main {
                position: fixed;
                top: 4rem;
                left: 4rem;
                width: calc(100% - 4rem);
                height: calc(100vh - 4rem);
                overflow-y: auto;
                padding: 2rem;
                transition: left 0.5s ease, width 0.5s ease;
                background-color: var(--background-color);
            }

            main.menu-toggle {
                left: 20rem;
                width: calc(100% - 20rem);
            }

            main p {
                color: var(--text-color);
            }



            /*Responsividade*/
            @media (max-width:500px) {
                .right .icons-header {
                    display: none;
                }

                .sidebar {
                    width: 0px;
                }

                main {
                    margin-left: 0;
                }

                .main.menu-toggle {
                    margin-left: 0;
                }

                .menu.menu-toggle div:first-child {
                    width: 100%;
                    transform: rotate(-45deg) translate(-0.2rem, 0.3rem);
                }

                .menu.menu-toggle div:nth-child(2) {
                    opacity: 0;
                }

                .menu.menu-toggle div:last-child {
                    width: 100%;
                    transform: rotate(45deg) translate(-0.2rem, -0.3rem);
                }
            }
        </style>
    </head>

    <body>
        <header>
            <div class="left">
                <div class="menu-container">
                    <div class="menu" id="menu">
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                </div>
                <div class="brand">
                    <img src="../imagens/icons/home/head-gear-svgrepo-com.svg" alt="[]" class="logo">
                    <span class="name">JurisSmart</span>
                </div>
            </div>
            <div class="right">
                <a href="#" class="icons-header">
                    <img src="../imagens/icons/home/chat.svg" alt="[]">
                </a>
                <a href="#" class="icons-header">
                    <img src="../imagens/icons/home/question.svg" alt="[]">
                </a>
                <a href="#" class="icons-header">
                    <img src="../imagens/icons/home/notification.svg" alt="[]">
                </a>
                <div class="dropdown">
                    <a class="btn dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="../imagens/eu.png" alt="[]" class="user">
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Meus Dados</a></li>
                        <li><a class="dropdown-item" href="logout.jsp">Sair</a></li>
                        <li>
                            <a class="dropdown-item" href="#">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch" id="darkMode">
                                    <label class="form-check-label" for="darkMode">Modo Escuro</label>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="sidebar" id="sidebar">
            <nav>
                <ul>
                    <li>
                        <a href="#" class="menu-item">
                            <img src="../imagens/icons/home/home.svg" alt="[]">
                            <span>Primeiros Passos</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li><a href="#">Tutorial Inicial</a></li>
                            <li><a href="#">Passo a Passo</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="menu-item">
                            <img src="../imagens/icons/home/tools.svg" alt="[]">
                            <span>Configurações e Cadastros</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li><a href="#">Configurando Modelos</a></li>
                            <li><a href="#">Configurando Cores</a></li>
                            <li><a href="#">Cadastro Usuários</a></li>
                            <li><a href="#">Cadastro de Pessoas</a></li>
                            <li><a href="#">Cadastro de Parâmetros</a></li>
                            <li><a href="#">Cadastros de Metas de Produtividade</a></li>
                            <li><a href="#">Cadastro de Metas Para Gestão de Tempo</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="menu-item">
                            <img src="../imagens/icons/home/chart.svg" alt="[]">
                            <span>Gestão de Clientes</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li><a href="#">Lista de Clientes</a></li>
                            <li><a href="#">Histórico de Comunicação</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="menu-item">
                            <img src="../imagens/icons/home/tasks-svgrepo-com.svg" alt="[]">
                            <span>Visão Geral</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li><a href="#">Visão Resumida</a></li>
                            <li><a href="#">Relatórios</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="menu-item">
                            <img src="../imagens/icons/home/tasks-list-svgrepo-com.svg" alt="[]">
                            <span>Meus Compromissos</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li><a href="#">Painel de Trabalho Gerencial</a></li>
                            <li><a href="#">Minha Agenda</a></li>
                            <li><a href="#">Minhas Tarefas</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="menu-item">

                            <img src="../imagens/icons/home/code-scan-svgrepo-com.svg" alt="[]">
                            <span>Gestão de Demandas</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li><a href="#">Kanban</a></li>
                            <li><a href="#">Nova Demanda</a></li>
                            <li><a href="#">Lista de Demandas</a></li>
                            <li><a href="#">Movimentações Processuais</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="menu-item">
                            <img src="../imagens/icons/home/buildings-2-svgrepo-com.svg" alt="[]">
                            <span>Gestão de Processos</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li><a href="#">Consultar Processos</a></li>
                            <li><a href="#">Novo Processo Judicial</a></li>
                            <li><a href="#">Novo Processo Administrativo</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="menu-item">
                            <img src="../imagens/icons/home/file.svg" alt="[]">
                            <span>Produção Jurídica</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li><a href="#">Documentos Administrativos</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="menu-item">
                            <img src="../imagens/icons/home/money.svg" alt="[]">
                            <span>Financeiro</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li>
                                <a href="#" class="submenu-item">
                                    <span>Primeiros Passos</span>
                                    <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow down">
                                </a>
                                <ul class="sub-submenu">
                                    <li><a href="#">Passo a Passo</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="submenu-item">
                                    <span>Cadastros</span>
                                    <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow down">
                                </a>
                                <ul class="sub-submenu">
                                    <li><a href="#">Categorias</a></li>
                                    <li><a href="#">Contas</a></li>
                                    <li><a href="#">Contatos</a></li>
                                    <li><a href="#">Tags</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="submenu-item">
                                    <span>Metas</span>
                                    <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow down">
                                </a>
                                <ul class="sub-submenu">
                                    <li><a href="#">Orçamento</a></li>
                                    <li><a href="#">Economia</a></li>
                                    <li><a href="#">Relatórios</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="submenu-item">
                                    <span>Movimentações Financeiras</span>
                                    <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow down">
                                </a>
                                <ul class="sub-submenu">
                                    <li><a href="#">Contas a Pagar</a></li>
                                    <li><a href="#">Contas a Receber</a></li>
                                    <li><a href="#">Últimos Lançamentos</a></li>
                                    <li><a href="#">Fluxo de Caixa</a></li>
                                    <li><a href="#">Extrato de Contas</a></li>
                                    <li><a href="#">Cartões</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="submenu-item">
                                    <span>Investimentos</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="menu-item">
                            <img src="../imagens/icons/home/library-svgrepo-com.svg" alt="[]">
                            <span>Biblioteca Jurídica</span>
                            <img src="../imagens/icons/home/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                        </a>
                        <ul class="submenu">
                            <li><a href="#">Legislações</a></li>
                            <li><a href="#">Jurisprudências</a></li>
                            <li><a href="#">Doutrinas</a></li>
                            <li><a href="#">Artigos Científicos</a></li>
                            <li><a href="#">Pod Casts</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>

        <main id="main">
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates ipsa sit repellat natus cum sunt totam!
                Voluptates nam sunt minima, fugiat eius distinctio dolor cumque officia sit maiores amet non!</p>
        </main>

        <script src="../js/script.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>

</html>