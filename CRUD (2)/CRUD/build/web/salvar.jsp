
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvar telefone</title>
        <style>
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
            color: #28a745;
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
        
        }
    </style>
    </head>
    <body>
        
         <div class="container">
        <h1>Exclusão de Filme</h1>
        
        <%
           int id;
           String nome;
           String classificacao;
           String diretor;
         
           
           id = Integer.parseInt(request.getParameter("id"));
           nome = request.getParameter("nome");
           classificacao = request.getParameter("classificacao");           
           diretor = request.getParameter("diretor");           
                 
	   //Fazendo a conexão com o BD.

        try{
        Connection conecta;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/crudfilmes";
        String user="root";
        String password="";
        conecta = DriverManager.getConnection(url, user, password);
        //inserindo dados na tabela produto do BD
        String sql=("INSERT INTO filmes VALUES (?,?,?,?)");
        st = conecta.prepareStatement(sql);
        st.setInt(1, id); // indica que será inserido na primeira posição
        st.setString(2, nome);
        st.setString(3, classificacao);
        st.setString(4, diretor);
     
        st.executeUpdate(); //executa o comando insert
        out.print("<p style='color:#8a1313;  font-size:25px  '> CADASTRADO COM SUCESSO...</p>");
        
            } catch (Exception x){
            String erro = x.getMessage();
            if (erro.contains("Duplicate entry")){
            out.print("<p style='color:red;font-size:25px'>Este id ja está cadastrado</p>");
            } else {
            out.print("<p style='color:red;font-size:25px'>Mensagem de erro: " + erro + "</p>");
            }
            
            
            
            }
           
           
           
            %>
    </body>
</html>
