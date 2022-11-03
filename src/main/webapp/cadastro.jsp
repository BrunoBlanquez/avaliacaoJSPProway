<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.blog.entidades.Usuario" %>
<%@ page import="com.blog.dao.DaoUsuario" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous" defer></script>

</head>
<body>
<main class="container">
    <div class="position-absolute top-0 end-0">
        <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
        <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
    </div>
    <h2>Faça seu cadastro para poder comentar!</h2>
    <form action="cadastro.jsp" method="POST" class="container-sm">
        <div class="mb-3">
            <label for="inputNome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="inputNome" name="inputNome">
        </div>
        <div class="mb-3">
            <label for="inputEmail" class="form-label">Email</label>
            <input type="email" class="form-control" id="inputEmail" name="inputEmail">
        </div>
         <div class="mb-3">
            <label for="inputUsuario" class="form-label">Usuário</label>
            <input type="text" class="form-control" id="inputUsuario" name="inputUsuario">
        </div>
        <div class="mb-3">
            <label for="inputPassword" class="form-label">Senha</label>
            <input type="password" class="form-control" id="inputPassword" name="inputPassword">
        </div>
        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>

    <%
        String nome = request.getParameter("inputNome");
        String email = request.getParameter("inputEmail");
        String user = request.getParameter("inputUsuario");
        String senha = request.getParameter("inputPassword");


        if(nome != null) {
            Usuario u = new Usuario(nome, email, user, senha);
            String retorno = DaoUsuario.salvar(u);
            response.sendRedirect("login.jsp");
        }
    %>
</main>
</body>
</html>