<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.lanp.ajax.db.DBUtils" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%!
  //访问数据库取得下级选项信息
  JSONArray getOptions(String selectedId) {
    System.out.println("---------" + selectedId + "=========");
    int counter = 0;
//    StringBuffer opts = new StringBuffer();
    List<String> opts = new ArrayList<String>();
    String sql = "select * from select_menu where pid=? order by seq asc";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
//    String[] opts=null;
    try {
      conn = DBUtils.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, selectedId);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        //如果不是第一项，追加一个","用于分隔选项
//        if(counter > 0) {
//          opts.append(",");
//        }
//        opts.append("{\"");
//        opts.append(rs.getString("id"));
//        opts.append("\",\"");
//        opts.append(rs.getString("text"));
//        opts.append("\"}");
//        counter++;
//        System.out.println(rs);
//        counter++;

          opts.add(rs.getString("id")+":"+rs.getString("text"));

//        opts.add(rs.getString("id"));
//        opts.add(rs.getString("text"));

      }
    } catch (SQLException e) {
      System.out.println(e.toString());
    } finally {
      DBUtils.closeResources(conn, pstmt, rs);
    }


    JSONArray jsonList = JSONArray.fromObject(opts);
    String jsonstr = jsonList.toString();
    System.out.println(jsonstr);
    return jsonList;

  }
%>

<%
  out.clear();
  String selectedId = request.getParameter("selectedId");
  JSONArray optionsInfo = getOptions(selectedId);
  out.print(optionsInfo);
%>