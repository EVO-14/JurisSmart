
<div class="sidebar" id="sidebar">
    <nav>
        <ul>
            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/home.svg" alt="[]">
                    <span>Primeiros Passos</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li><a href="<%= request.getContextPath()%>/view/primPassos/tutorial.jsp">Tutorial Inicial</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/primPassos/passoPasso.jsp">Passo a Passo</a></li>
                </ul>
            </li>

            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/tools.svg" alt="[]">
                    <span>Configurações e Cadastros</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li><a href="<%= request.getContextPath()%>/view/configCad/configurandoModelo.jsp">Configurando Modelos</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/configCad/configurandoCor.jsp">Configurando Cores</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/configCad/cadastroUsuario.jsp">Cadastro de Usuários</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/configCad/cadastroPessoa.jsp">Cadastro de Pessoas</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/configCad/cadastroParametro.jsp">Cadastro de Parâmetros</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/configCad/cadastroProdutividade.jsp">Cadastros de Metas de Produtividade</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/configCad/cadastroTempo.jsp">Cadastro de Metas Para Gestão de Tempo</a></li>
                </ul>
            </li>

            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/chart.svg" alt="[]">
                    <span>Gestão de Clientes</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li><a href="<%= request.getContextPath()%>/view/gestaoCli/listaCli.jsp">Lista de Clientes</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/gestaoCli/historicoComun.jsp">Histórico de Comunicação</a></li>
                </ul>
            </li>

            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/tasks-svgrepo-com.svg" alt="[]">
                    <span>Visão Geral</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li><a href="<%= request.getContextPath()%>/view/visãoGeral/visãoResu.jsp">Visão Resumida</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/visãoGeral/relatorio.jsp">Relatórios</a></li>
                </ul>
            </li>

            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/tasks-list-svgrepo-com.svg" alt="[]">
                    <span>Meus Compromissos</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li><a href="<%= request.getContextPath()%>/view/meusComp/painelTrab.jsp">Painel de Trabalho Gerencial</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/meusComp/minhaAgenda.jsp">Minha Agenda</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/meusComp/minhaTarefa.jsp">Minhas Tarefas</a></li>
                </ul>
            </li>

            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/code-scan-svgrepo-com.svg" alt="[]">
                    <span>Gestão de Demandas</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li><a href="<%= request.getContextPath()%>/view/gestaoDemanda/kanban.jsp">Kanban</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/gestaoDemanda/novaDemanda.jsp">Nova Demanda</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/gestaoDemanda/listaDemanda.jsp">Lista de Demandas</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/gestaoDemanda/movimentacaoProc.jsp">Movimentações Processuais</a></li>
                </ul>
            </li>

            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/buildings-2-svgrepo-com.svg" alt="[]">
                    <span>Gestão de Processos</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li><a href="<%= request.getContextPath()%>/view/gestaoProcesso/consultarProc.jsp">Consultar Processos</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/gestaoProcesso/novoProcJud.jsp">Novo Processo Judicial</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/gestaoProcesso/novoProcAdm.jsp">Novo Processo Administrativo</a></li>
                </ul>
            </li>

            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/file.svg" alt="[]">
                    <span>Produção Jurídica</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li><a href="<%= request.getContextPath()%>/view/producaoJur/documentoAdm.jsp">Documentos Administrativos</a></li>
                </ul>
            </li>

            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/money.svg" alt="[]">
                    <span>Financeiro</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li>
                        <a href="#" class="submenu-item">
                            <span>Primeiros Passos</span>
                            <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow down">
                        </a>
                        <ul class="sub-submenu">
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/primeirosPassos/passoPasso.jsp">Passo a Passo</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="submenu-item">
                            <span>Cadastros</span>
                            <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow down">
                        </a>
                        <ul class="sub-submenu">
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/cadastros/categorias.jsp">Categorias</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/cadastros/contas.jsp">Contas</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/cadastros/contatos.jsp">Contatos</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/cadastros/tags.jsp">Tags</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="submenu-item">
                            <span>Metas</span>
                            <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow down">
                        </a>
                        <ul class="sub-submenu">
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/metas/orcamento.jsp">Orçamento</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/metas/economia.jsp">Economia</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/metas/relatorio.jsp">Relatórios</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="submenu-item">
                            <span>Movimentações Financeiras</span>
                            <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow down">
                        </a>
                        <ul class="sub-submenu">
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/movimentacoesFinanceiras/contasPagar.jsp">Contas a Pagar</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/movimentacoesFinanceiras/contasReceber.jsp">Contas a Receber</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/movimentacoesFinanceiras/ultimoLancamento.jsp">Últimos Lançamentos</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/movimentacoesFinanceiras/fluxoCaixa.jsp">Fluxo de Caixa</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/movimentacoesFinanceiras/extratoConta.jsp">Extrato de Contas</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/financeiro/movimentacoesFinanceiras/cartoes.jsp">Cartões</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath()%>/view/financeiro/investimento.jsp" class="submenu-item">
                            <span>Investimentos</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="#" class="menu-item">
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/library-svgrepo-com.svg" alt="[]">
                    <span>Biblioteca Jurídica</span>
                    <img src="<%= request.getContextPath()%>/imagens/icons/template/arrow-down-svgrepo-com.svg" alt="[]" class="arrow">
                </a>
                <ul class="submenu">
                    <li><a href="<%= request.getContextPath()%>/view/bibliotecaJur/legislacao.jsp">Legislações</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/bibliotecaJur/jurisprudencia.jsp">Jurisprudências</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/bibliotecaJur/doutrina.jsp">Doutrinas</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/bibliotecaJur/artigoCientifico.jsp">Artigos Científicos</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/bibliotecaJur/podCast.jsp">Pod Casts</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>