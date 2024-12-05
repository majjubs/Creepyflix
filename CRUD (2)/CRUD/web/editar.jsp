<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Alterar produto</title>
         <link rel="stylesheet" href="editar.css">
    </head>
    <body>
       
        <%
            // Recebe o ID do produto a alterar e armazena na variável "id"
            int id;
            String idParam = request.getParameter("id");
            String mensagemErro = null;

            // Verifica se o parâmetro ID é válido
            if (idParam != null && !idParam.isEmpty()) {
                id = Integer.parseInt(idParam);
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/crudfilmes";
                String user = "root";
                String password = "";
                conecta = DriverManager.getConnection(url, user, password);
                
                // Busca o produto pelo código recebido
                String sql = "SELECT * FROM filmes WHERE id=?";
                st = conecta.prepareStatement(sql);
                st.setInt(1, id);
                ResultSet resultado = st.executeQuery();
                
                // Verifica se o produto foi encontrado
                if (!resultado.next()) { 
                    mensagemErro = "<p style='color:red;font-size:25px'>Filme não encontrado</p>";
                } else {
                    // Armazena os dados do produto se encontrado
                    String nome = resultado.getString("nome");
                    String classificacao = resultado.getString("classificacao");
                    String diretor = resultado.getString("diretor");
                  
        %>
        <form method="post" action="atualizar.jsp">
            <header>Editar</header>
             <a href="consultar.jsp">Voltar</a>
            <p>  
                <label for="id">ID</label>
                <input type="number" name="id" id="id" value="<%= resultado.getString("id") %>" readonly>
    
            </p>
            
            <p>
                <label for="nome">Nome</label>
                <input type="text" name="nome" id="nome"  value="<%= resultado.getString("nome") %>">
            </p>
            
            <p>
                <label for="classificacao">classificacao</label>
                <input type="text" name="classificacao" id="classificacao" value="<%= resultado.getString("classificacao") %>">
            </p>
            
            <p>
                <label for="diretor">diretor</label>
                <input type="text" name="diretor" id="diretor" value="<%= resultado.getString("diretor") %>">
            </p>
            

            
            <p>
                <input type="submit" value="Salvar"/>
            </p>
        </form>
        <%
                }
                // Fecha a conexão com o banco de dados
                conecta.close();
            } else {
                mensagemErro = "ID inválido.";
            }

            // Exibe mensagem de erro se houver
            if (mensagemErro != null) {
                out.print("<p style='color:red;'>" + mensagemErro + "</p>");
            }
        %>
    </body>
</html>