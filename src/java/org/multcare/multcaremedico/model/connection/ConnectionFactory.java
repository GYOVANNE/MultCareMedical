package org.multcare.multcaremedico.model.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Gyovanne Cavalcanti
 */
public class ConnectionFactory {

    //Alterando localização do jdbc. Localização do diretorio do banco dentro da aplicação.
    private static final String DRIVER = "org.sqlite.JDBC";
    private static final String URL = "jdbc:sqlite:C:\\Users\\gyova\\Documents\\MEGA\\MultCare\\MulCareMedico\\DB\\cdapi.db";

    /**
     *
     * @return
     */
    public static Connection getConnection() {
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL);

        } catch (ClassNotFoundException | SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getLocalizedMessage());
            throw new RuntimeException(ex.getLocalizedMessage());
        }
    }

    /**
     *
     * @param con
     */
    public static void closeConnection(Connection con) {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            System.err.println(ex.getLocalizedMessage());
        }
    }

    /**
     *
     * @param con
     * @param stmt
     */
    public static void closeConnection(Connection con, PreparedStatement stmt) {
        closeConnection(con);
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException ex) {
            System.err.println(ex.getLocalizedMessage());
        }
    }

    /**
     *
     * @param con
     * @param stmt
     * @param rs
     */
    public static void closeConnection(Connection con, PreparedStatement stmt, ResultSet rs) {
        closeConnection(con, stmt);
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            System.err.println(ex.getLocalizedMessage());
        }
    }
}
