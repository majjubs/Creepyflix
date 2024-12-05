<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            
            int id;
            String nome;
            String celular;
            String email;
          
            
            id = Integer.parseInt(request.getParameter("id"));
            nome = request.getParameter("nome");
            celular = request.getParameter("classificacao");
            email = request.getParameter("diretor");
         
                Connection conecta;
                PreparedStatement pst;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/crudfilmes";
                String user="root";
                String password="";
                conecta=DriverManager.getConnection(url,user,password);
                
                //instrução sql
                String sql = "UPDATE filmes SET nome=?, classificacao=?, diretor=?,  WHERE id=?";
                pst = conecta.prepareStatement(sql);
                pst.setString(1, nome);
                pst.setString(2, classificacao);
                pst.setString(3, diretor);
                pst.setInt(5,id );
                pst.executeUpdate();
                out.print("Os dados do contato" + " " + id + " " +"foram alterados com sucesso");
            %>
    </body>
</html>===