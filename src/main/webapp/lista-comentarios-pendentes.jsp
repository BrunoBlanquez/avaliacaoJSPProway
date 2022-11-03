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

    <div class="position-absolute top-0 end-0">
        <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
        <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
    </div>
    <div class="position-absolute top-0 start-50 translate-middle-x" style="width: 560px">
        <h2>Lista Comentarios</h2>

            <%
                List<Comentario> comentarios = DaoComentario.consultarTodos();
                for(Comentario comentario : comentarios){
                    out.write("<div>");
                    out.write("<p>" + comentario.getComentario() + "</p>");
                    out.write("</div>");
                    if(!comentario.isAutorizado()){
                        out.write("<a href='autoriza-comentario.jsp?id=" + comentario.getIdComentario() + "'><button class='btn btn-success'>Aprovar comentario</button></a>");
                    } else {
                        out.write("<button class='btn btn-info'>Já está aprovado!</button>");
                    }
                    out.write("<br><br><br>");
                }
            %>
    </div>


    <div class="position-absolute top-0 end-0">
        <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
        <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
    </div>
</main>
</body>
</html>