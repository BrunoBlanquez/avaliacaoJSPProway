<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.blog.entidades.Post" %>
<%@page import="com.blog.dao.DaoPost" %>
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
<body onload="mostraComandosAdmin()">
<main class="container">

<%
    String pegaIdParameter = request.getParameter("id");
    Post p = DaoPost.consultarIndividual(Integer.parseInt(pegaIdParameter));
    System.out.println(p.getId());
%>

    <div class="position-absolute top-0 end-0">
        <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
        <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
    </div>
    <div class="position-absolute top-0 start-50 translate-middle-x" style="width: 560px">
        <h2>Post Completo</h2>
        <form action="postcompleto.jsp?id=<%=p.getId()%>" method="POST" class="">
            <div class="mb-3">
                <label for="inputTitle" class="form-label">Título</label>
                <input type="text" class="form-control" id="inputTitle" name="inputTitle" value="<% out.write(p.getTitulo()); %>">
            </div>
            <div class="mb-3">
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Publicação" name="inputTexto" maxlength="500" id="inputTexto" style="resize: none; height: 150px"><% out.write(p.getDescricao()); %></textarea>
                    <label for="inputTexto">Publicação (Máx 500 char)</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Alterar</button>
        </form>


    </div>
<%
    String titulo = request.getParameter("inputTitle");
    String texto = request.getParameter("inputTexto");

    if(titulo != null && texto != null) {
        p.setTitulo(titulo);
        p.setDescricao(texto);

        String retorno = DaoPost.alterar(p);
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