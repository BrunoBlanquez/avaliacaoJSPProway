<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.blog.entidades.Post" %>
<%@page import="com.blog.dao.DaoPost" %>
<%@page import="com.blog.entidades.Usuario" %>
<%@page import="com.blog.dao.DaoUsuario" %>
<%@page import="com.blog.entidades.Comentario" %>
<%@page import="com.blog.dao.DaoComentario" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous" defer></script>
</head>
<script>

</script>
<body>
<main class="container">

<%
    String pegaIdParameter = request.getParameter("id");
    Post p = DaoPost.consultarIndividual(Integer.parseInt(pegaIdParameter));

    Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
    boolean logado = false;

    if(usuarioLogado != null) {
        logado = true;
    }
    System.out.println(usuarioLogado.getTipo());
%>

    <div class="position-absolute top-0 end-0">
        <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
        <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
    </div>
    <div class="position-absolute top-0 start-50 translate-middle-x" style="width: 560px">
        <h2>Post Completo</h2>
        <form method="POST" class="">
            <div class="mb-3">
                <label for="inputTitle" class="form-label">Título</label>
                <input type="text" class="form-control" id="inputTitle" name="inputTitle" value="<% out.write(p.getTitulo()); %>" readonly>
            </div>
            <div class="mb-3">
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Publicação" name="inputTexto" maxlength="500" id="inputTexto" style="resize: none; height: 150px" readonly><% out.write(p.getDescricao()); %></textarea>
                    <label for="inputTexto">Publicação</label>
                </div>
            </div>
        </form>

        <% if(logado == false) { %>
            <h3 class="" id="avisoLogado">É preciso estar logado para comentar!</h3>
        <% } %>

        <div class="comentarios" id="comentarios">
            <h3>Deixe seu comentário</h3>
            <form action="postcompleto.jsp?id=<%=p.getId()%>" method="POST" class="">
                <div class="mb-3">
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Publicação" name="inputComentario" maxlength="500" id="inputComentario" style="resize: none; height: 100px"></textarea>
                        <label for="inputComentario">Máx 200 char</label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Comentar!</button>
            </form>
        </div>
    </div>
<%
    String comentario = request.getParameter("inputComentario");
    String post = request.getParameter("id");




    if(comentario != null) {
       Comentario c = new Comentario();
        response.sendRedirect("postagens.jsp");
    }
%>

    <div class="position-absolute top-0 end-0">
        <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
        <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
    </div>
</main>
</body>
</html>