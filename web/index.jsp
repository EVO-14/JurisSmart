<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="util.Conexao"%>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>| LOGIN - JurisSmart |</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="icon" href="imagens/icons/template/head-gear-svgrepo-com.svg" type="image/x-icon">

        <style>
            body {
                display: grid;
                place-items: center;
                background-color: #153B6B;
                animation: rotate 1s infinite alternate linear;
            }

            button {
                background-color: transparent;
                border: 0;
                cursor: pointer;
            }

            .control {
                border: 0;
                border-radius: 8px;
                outline: none;
                width: 100%;
                height: 56px;
                padding: 0 16px;
                background-color: #f5f2f8;
                color: #5a4f79;
                font-family: inherit;
                font-size: 16px;
                transition: 0.4s;
            }

            .login-card {
                width: 350px;
                padding: 50px 30px 64px;
                border-radius: 1.25rem;
                background-color: #ffffff;
                text-align: center;
            }

            .login-card .logo-login img {
                width: 80%;
            }

            .login-card>h2 {
                font-size: 36px;
                font-weight: 600;
                margin: 0 0 6px;
            }

            .login-card>h3 {
                color: #837f90;
                margin: 15px 0 40px;
                font-weight: 500;
                font-size: 1rem;
            }

            .login-form {
                width: 100%;
                margin: 0;
                display: grid;
                gap: 16px;
            }

            .login-form input.control::placeholder {
                color: #837f90;
            }

            .login-form>button.control {
                cursor: pointer;
                width: 100%;
                height: 56px;
                padding: 0 16px;
                background-color: #FDBC59;
                color: #f9f9f9;
                border: 0;
                font-family: inherit;
                font-size: 1rem;
                font-weight: bold;
                text-align: center;
                letter-spacing: 2px;
                transition: all 0.375s;
            }

            .password {
                position: relative;
                display: flex;
                align-items: center;
            }

            .toggle-password {
                position: absolute;
                right: 10px;
                background: none;
                border: none;
                cursor: pointer;
                padding: 5px;
            }

            .toggle-password svg {
                width: 24px;
                height: 24px;
                transition: 0.3s ease-in-out;
            }


            @media (max-width: 900px) {
                .login-card {
                    width: 250px;
                    margin: 30px;
                }
            }

            .custom-popup {
                position: fixed;
                top: 85%; /* ajuste aqui para mover a janela para baixo */
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #e70b0ba9;
                color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
                z-index: 9999;
                opacity: 1;
                transition: opacity 0.8s ease; /* Transição suave de opacidade */
            }

            .popup-content {
                font-size: 16px;
            }
        </style>
    </head>

    <body>
        <div class="body-login">
            <div class="login-card">
                <div class="logo-login">
                    <img class="img-fluid" src="./imagens/logo.jpeg" alt="">
                </div>
                <h3>Entre com seu usuário e senha</h3>
                <form class="login-form" method="post" action="index.jsp">
                    <input class="control" type="text" name="txtUsuario" id="txtUsuario" placeholder="Usuário" required/>
                    <div class="password">
                        <input class="control" name="txtSenha" id="txtSenha" type="password" placeholder="Senha" required/>
                        <button type="button" class="toggle-password" onclick="togglePassword()">
                            <img id="eyeOpen" src="./imagens/icons/index/eye-slash-svgrepo-com.svg" alt="Mostrar senha" width="24" height="24">
                            <img id="eyeClosed" src="./imagens/icons/index/eye-svgrepo-com.svg" alt="Ocultar senha" width="24" height="24" style="display: none;">
                        </button>
                    </div>
                    <button type="submit" class="btn btn-secondary control">LOGIN</button>
                </form>
            </div>
            <%
                String usuario = request.getParameter("txtUsuario");
                String senha = request.getParameter("txtSenha");

                String user = "", pass = "", image = "";

                int i = 0;

                try {
                    st = new Conexao().conectar().createStatement();
                    rs = st.executeQuery("SELECT * FROM usuario WHERE email = '" + usuario + "' AND senha = '" + senha + "'");
                    while (rs.next()) {
                        user = rs.getString(3);
                        pass = rs.getString(8);
                        image = rs.getString(13);
                        //rs.last();
                        //i = rs.getRow();
                    }
                } catch (Exception e) {
                    out.print(e);
                }
                //out.println(i);

                if (usuario == null || senha == null) {
                    out.println("");
                } else {
                    if (usuario.equals(user) && senha.equals(pass)) {
                        session.setAttribute("emailUsuario", user);
                        session.setAttribute("fotoUser", image);
                        response.sendRedirect(request.getContextPath() + "/view/home.jsp");
                    } else { %>
            <script>
                function showPopup(message) {
                    var popup = document.createElement('div');
                    popup.className = 'custom-popup';
                    popup.innerHTML = '<div class="popup-content">' + message + '</div>';
                    document.body.appendChild(popup);

                    setTimeout(function () {
                        popup.style.opacity = '0';
                        setTimeout(function () {
                            popup.remove();
                        }, 300);
                    }, 5000);
                }
                showPopup("Dados Incorretos!");
            </script>
            <%}
                }
            %>
        </div>
        <script>
            function togglePassword() {
                const passwordInput = document.getElementById("txtSenha");
                const eyeOpen = document.getElementById("eyeOpen");
                const eyeClosed = document.getElementById("eyeClosed");

                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    eyeOpen.style.display = "none";
                    eyeClosed.style.display = "inline";
                } else {
                    passwordInput.type = "password";
                    eyeOpen.style.display = "inline";
                    eyeClosed.style.display = "none";
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>