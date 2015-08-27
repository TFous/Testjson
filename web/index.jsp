
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/17
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>


<script>


    var xmlHttp;
    var currFaqId;
    function creatXmlHttp(){
        if(window.XMLHttpRequest){
            xmlHttp=new XMLHttpRequest();
        }else{
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
    }


    function loadFAQ(faqid){
        currFaqId=faqid;
        var currFaqDetail=getFaqDetailDiv(faqid);
        if(currFaqDetail.style.display=="none"){
            currFaqDetail.style.display="block";
            if(currFaqDetail.innerHTML==""){
                creatXmlHttp();
                xmlHttp.onreadystatechange=loadFAQCallback;
                xmlHttp.open("GET","read_faq.jsp?faqid="+faqid,true);
                xmlHttp.send(null);
            }
        }else{
            currFaqDetail.style.display="none";
        }
    }


    function loadFAQCallback(){
        if(xmlHttp.readyState==4){
            getFaqDetailDiv(currFaqId).innerHTML=xmlHttp.responseText;
        }
    }

    function getFaqDetailDiv(faqid){
        return document.getElementById("faqDetail"+faqid);
    }

</script>








<%
    //从配置参数中获取驱动
    String driver = application.getInitParameter("driver");
//从配置参数中获取数据库url
    String url = application.getInitParameter("url");
//从配置参数中获取用户名
    String user = application.getInitParameter("user");
//从配置参数中获取密码
    String pass = application.getInitParameter("pass");
//注册驱动
    Class.forName(driver);
//获取数据库连接
    Connection conn = DriverManager.getConnection(url,user,pass);
//创建Statement对象
    Statement stmt = conn.createStatement();
//执行查询
    ResultSet rs = stmt.executeQuery("select * from faq");
%>
<table bgcolor="#dbdbdb" border="1" width="480">
    <%
        //遍历结果集
        while (rs.next()) {
    %>
    <tr>
        <td>
            <%=rs.getString(1)%>
        </td>
        <td>
            <a href="#" onclick="loadFAQ(<%=rs.getInt(1)%>);return false;">
                <%=rs.getString(2)%>
            </a>
        </td>
        <td>
            <div id="faqDetail<%=rs.getInt(1)%>"></div>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
