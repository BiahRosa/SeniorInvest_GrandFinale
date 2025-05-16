package br.dev.biah.seniorinvest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    private static ConnectionManager instance;

    private ConnectionManager() { }

    public static ConnectionManager getInstance() {
        if (instance == null) {
            instance = new ConnectionManager();
        }
        return instance;
    }

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            return DriverManager.getConnection(
                    "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL",
                    "SEU_USUARIO",
                    "SUA_SENHA"
            );
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Erro ao conectar com o banco", e);
        }
    }
}
