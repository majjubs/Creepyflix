<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Exclusão de Filme</title>
    <style>
        /* Estilo geral da página */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Container principal */
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            text-align: center;
        }

        /* Título da página */
        h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 20px;
        }

        /* Estilo para mensagens de sucesso e erro */
        .sucesso {
            color: #8a1313;
            font-size: 18px;
            margin: 10px 0;
            font-weight: bold;
        }

        .erro {
            color: #dc3545;
            font-size: 18px;
            margin: 10px 0;
            font-weight: bold;
        }

        /* Estilo para mensagens de erro no Java */
        .erro-js {
            color: #007bff;
            font-size: 16px;
        }
        a{
            color: black;
            text-decoration: none;
        }
     
        @media  (min-width: 360px) and (max-width: 800px){
                .container {
            background-color: white;
            padding: 70px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            text-align: center;
            margin-top: 70%;
        }  
           h1 {
            color: #000;
            font-size: 48px;
            margin-bottom: 20px;
        }
        p{
          color: red;
          font-size: 38px;
        }
          .erro {
            color: #dc3545;
            font-size: 30px;
            margin: 10px 0;
            font-weight: bold;
        }
      
        
        }
    </style>
</head>
<body>
     
    <div class="container">
        <h1>Exclusão de Filme</h1>

        <%
            int id;
            id = Integer.parseInt(request.getParameter("id"));
            try {
                // Conecta ao banco de dados chamado bancojsp_b
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/crudfilmes";
                String user = "root";
                String password = "";
                conecta = DriverManager.getConnection(url, user, password);

                // Exclui o produto com o código informado
                String sql = "DELETE FROM filmes WHERE id=?";
                st = conecta.prepareStatement(sql);
                st.setInt(1, id);
                int resultado = st.executeUpdate(); // Executa o DELETE

                // Verifica se o produto foi excluído
                if (resultado == 0) {
                    out.print("<div class='erro'>Este filme não está cadastrado.</div>");
                } else {
                    out.print("<div class='sucesso'>O filme com código " + id + " foi excluído com sucesso.</div>");
                }

            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("<div class='erro-js'>Erro: " + mensagemErro + "</div>");
            }
        %>
    </div>

</body>
</html>