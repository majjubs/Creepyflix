<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Atualizar produto</title>
</head>
<body>
    <%
    // Recebe os dados do formulário
    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String classificacao = request.getParameter("classificacao");
    String diretor = request.getParameter("diretor");

    // Conecta ao banco de dados
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/crudfilmes";
    String user = "root";
    String password = "";
    Connection conecta = DriverManager.getConnection(url, user, password);

    // Atualiza o registro
    String sql = "UPDATE filmes SET nome=?, classificacao=?, diretor=? WHERE id=?";
    PreparedStatement st = conecta.prepareStatement(sql);
    st.setString(1, nome);
    st.setString(2, classificacao);
    st.setString(3, diretor);
    st.setInt(4, id);
    st.executeUpdate();

    // Fecha a conexão
    conecta.close();

    // Redireciona para consultar.jsp
    response.sendRedirect("consultar.jsp");
    %>
</body>
</html>