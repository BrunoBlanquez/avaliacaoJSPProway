<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.blog.entidades.Post" %>
<%@page import="com.blog.dao.DaoPost" %>
<%@ page import="com.blog.entidades.Usuario" %>
<%@ page import="com.blog.dao.DaoUsuario" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous" defer></script>
    <style>
        .ellipsis {
            max-width: 150px;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

    </style>
</head>
<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
    boolean logado = false;

    if(usuarioLogado != null && usuarioLogado.getTipo().equals("admin")) {
        logado = true;
    }
%>
<body onload="mostraComandosAdmin()">
<main class="container">
    <div class="position-absolute top-0 end-0">
        <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
        <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
    </div>
    <div class="position-absolute top-0 start-50 translate-middle-x">
        <h2>lista completa de postatens</h2>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Titulo</th>
                    <th scope="col">Descricao</th>
                    <th scope="col">Ver mais</th>
                    <% if(logado) { %>
                    <th class="admin" id="thAdmin" scope="col">Editar</th>
                    <th class="admin" id="thAdmin" scope="col">Excluir</th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Post> lista = DaoPost.listarPostagens();
                    for(Post p : lista) {
                        out.write("<tr>");
                        out.write("<td>" + p.getId() + "</td>");
                        out.write("<td>" + p.getTitulo() + "</td>");
                        out.write("<td class=ellipsis>" + p.getDescricao() + "</td>");
                        out.write("<td><a href='postcompleto.jsp?id=" + p.getId() + "'>" + "Ver mais" + "</a>" + "</td>");
                        if(logado) {
                            out.write("<td class=admin id=tdAdmin><a href='editar.jsp?id=" + p.getId() +"'>Editar</a></td>");
                            out.write("<td class=admin id=tdAdmin><a href='delete.jsp?id=" + p.getId() +"'>Deletar</a></td>");
                        }
                        out.write("</tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
    <div class="position-absolute top-0 end-0">
        <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
        <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
    </div>
</main>
</body>
</html>