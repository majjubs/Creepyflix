<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar</title>
        <link rel="stylesheet" href="consultar.css"/>
    </head>
    <body>
<%
            try {
            // Fazer a conexao com o banco de dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/crudfilmes";
            String user="root";
            String password="";
            conecta=DriverManager.getConnection(url,user,password);
            // Lista os dados  da tabela produto do banco de dados
            String sql=("SELECT * FROM filmes");
            st=conecta.prepareStatement(sql);
            // ResultSet serve para guardar aquilo que é trazido do BD
            ResultSet rs=st.executeQuery();
            // Enquanto não chegar no final, ele vai executar
            // o que estiver dentro do while 
            // vamos montar uma tabela html
            // criando o titulo da tabela 
            // encerrar o código Java            
        %>
        
        
        <table border="1">
           
            <header>
                <a href="index.html">Voltar</a>
                 <h1>Consultar</h1>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Classificacao</th>
                <th>diretor</th>
                <th>ações</th>
             </tr>
             <header>
            <%
                while (rs.next()){                               
            %>
                <!--<!-- Finalizei o codigo java acima e agora vou 
                criar uma tabela html para mostrar os dados trazidos
                do BD-->
            <tr>
                <td>
                    <%= rs.getString("id")%>
                </td>
                <td>
                    <%= rs.getString("nome")%>
                </td>
                <td>
                    <%= rs.getString("classificacao")%>
                </td>
                <td>
                    <%= rs.getString("diretor")%>
                </td>
                 
            <td class="acoes">
           <a href="editar.jsp?id=<%= rs.getString("id") %>&nome=<%= rs.getString("nome") %>&classificacao=<%= rs.getString("classificacao") %>&diretor=<%= rs.getString("diretor") %>">
    <img src="icons/editar.svg" alt="Editar" class="icon">
</a>

            <a href="excluir.html">
              <img src="icons/lixeira.svg" alt="Excluir" class="icon">
            </a>
          </td>
            </tr>
            <%
            }
            %>
            <table>
          <% 
            } catch (Exception x) {
                out.print ("Mensagem de erro: " + x.getMessage());
            }
        %>
    </body>
</html>