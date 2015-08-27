package ajax.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * �������ݿ�Ĺ�����,������ɲ��ɼ̳�����˽�з���
 * @author lanp
 * @since 2012-2-29 22:27
 */
public final class DBUtils {
    private static String url = "jdbc:mysql://localhost:3306/test_817";
    private static String user = "root";
    private static String psw = "admin";

    private static  Connection conn;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    private DBUtils() {

    }

    /**
     * ��ȡ���ݿ������
     * @return conn
     */
    public static Connection getConnection() {
        try {
            conn = DriverManager.getConnection(url, user, psw);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return conn;
    }

    /**
     * �ͷ���Դ
     * @param conn
     * @param pstmt
     * @param rs
     */
    public static void closeResources(Connection conn,PreparedStatement pstmt,ResultSet rs) {
        if(null != rs) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            } finally {
                if(null != pstmt) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        throw new RuntimeException(e);
                    } finally {
                        if(null != conn) {
                            try {
                                conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                                throw new RuntimeException(e);
                            }
                        }
                    }
                }
            }
        }
    }
}