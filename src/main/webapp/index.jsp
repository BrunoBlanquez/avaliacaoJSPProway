<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
    .admin {
        display: none;
    }
</style>
</head>
<body onload="mostraComandosAdmin()">
<main class="container">
<div class="position-absolute top-0 start-50 translate-middle-x">
    <h2>Bem vindos ao meu Blog!</h2>
</div>
<div class="position-absolute top-50 start-50 translate-middle">
    <a href="cadastro.jsp"><button type="submit" class="btn btn-primary">Cadastre-se</button></a>
    <a class="admin" href="novopost.jsp"><button type="submit" class="btn btn-primary">Nova publicação</button></a>
    <a href="postagens.jsp"><button type="submit" class="btn btn-primary">Ver postagens</button></a>
</div>
<div class="position-absolute top-0 end-0">
    <a href="index.jsp"><button type="submit" class="btn btn-primary">Página inicial</button></a>
    <a href="login.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
</div>
</main>
<script>
    const mostraComandosAdmin = () => {
        const btnAdmin = document.querySelectorAll(".admin")

        console.log(btnAdmin)
        if(sessionStorage.getItem("admin")) {
            btnAdmin.forEach(e => {
                e.classList.remove("admin");
            })
        } else {
           btnAdmin.forEach(e => {
            e.classList.add("admin");
           })
        }
    }
</script>
</body>
</html>
