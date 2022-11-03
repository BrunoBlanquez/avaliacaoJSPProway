<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.blog.entidades.Usuario" %>
<%@ page import="com.blog.dao.DaoUsuario" %>
<%@ page import="com.blog.dao.DaoModerador" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous" defer></script>
    <style>
        .oculto {
            display: none;
        }
    </style>
</head>
<body>
<%
    Usuario userLogado = (Usuario) session.getAttribute("usuario");
    Object adminLogado = session.getAttribute("admin");

    boolean logado = true;
    if(userLogado == null || adminLogado == null) {
        logado = false;
    }

    System.out.println(logado);
%>

<main class="container">
    <div class="position-absolute top-0 end-0">
        <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
        <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
    </div>
    <div class="position-absolute top-0 start-50 translate-middle-x">

    <% if(logado != true) { %>
        <h2>Faça o login na sua conta!</h2>
        <form method="POST" style="max-width: 1080px" id="formLogin">
           <div class="mb-3">
               <label for="inputUsuario" class="form-label">Usuário</label>
              <input type="text" class="form-control" id="inputUsuario" name="inputUsuario">
          </div>
          <div class="mb-3">
              <label for="inputPassword" class="form-label">Senha</label>
              <input type="password" class="form-control" id="inputPassword" name="inputPassword">
            </div>
            <button type="submit" class="btn btn-primary">Entrar</button>
        </form>
    <% } %>

    <% if(logado != false) { %>
    <button type="submit" class="btn btn-danger" id="logout" class="oculto" onclick="logout()">Sair</button>
    <% } %>

    </div>

<script>
    const botaoSair = document.getElementById("logout")

    const logout = () => {
        window.location.href = "logout.jsp";
    }
</script>

    <%
        String user = request.getParameter("inputUsuario");
        String senha = request.getParameter("inputPassword");

        if(user != null && !(user.isEmpty()) && senha != null && !(senha.isEmpty())) {
            Usuario usuario = DaoUsuario.consultarPorUser(user);

            if(DaoUsuario.podeLogar(user, senha)) {
                session.setAttribute("usuario", usuario);
            } else if(DaoModerador.podeLogar(user, senha)) {
                session.setAttribute("admin","admin");
            } else {
                out.write("<h3>Não foi possível acessar a conta</h3>");
            }
        }

    %>
</main>
</body>
</html>