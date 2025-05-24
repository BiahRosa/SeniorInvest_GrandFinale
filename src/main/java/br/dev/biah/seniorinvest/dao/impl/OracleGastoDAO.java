package br.dev.biah.seniorinvest.dao.impl;

import br.dev.biah.seniorinvest.dao.GastoDAO;
import br.dev.biah.seniorinvest.factory.ConnectionFactory;
import br.dev.biah.seniorinvest.model.Gasto;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OracleGastoDAO implements GastoDAO {

    @Override
    public void insert(Gasto gasto) {
        String sql = "INSERT INTO T_FIN_GASTO (id_gasto, descricao, valor, data_gasto, USUARIO_ID_USUARIO) " +
                "VALUES (seq_gasto.NEXTVAL, ?, ?, ?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, gasto.getDescricao());
            ps.setDouble(2, gasto.getValor());
            ps.setDate(3, Date.valueOf(gasto.getData()));
            ps.setInt(4, gasto.getIdUsuario());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Erro ao inserir gasto: " + e.getMessage());
        }
    }

    @Override
    public List<Gasto> getAll() {
        List<Gasto> lista = new ArrayList<>();
        String sql = "SELECT * FROM T_FIN_GASTO";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Gasto gasto = new Gasto();
                gasto.setId(rs.getInt("id_gasto"));
                gasto.setDescricao(rs.getString("descricao"));
                gasto.setValor(rs.getDouble("valor"));
                gasto.setData(rs.getDate("data_gasto").toLocalDate());
                gasto.setIdUsuario(rs.getInt("USUARIO_ID_USUARIO"));
                lista.add(gasto);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar gastos: " + e.getMessage());
        }

        return lista;
    }

    public List<Gasto> buscarPorUsuario(int idUsuario) {
        List<Gasto> lista = new ArrayList<>();
        String sql = "SELECT * FROM T_FIN_GASTO WHERE USUARIO_ID_USUARIO = ?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Gasto gasto = new Gasto();
                gasto.setId(rs.getInt("id_gasto"));
                gasto.setDescricao(rs.getString("descricao"));
                gasto.setValor(rs.getDouble("valor"));
                gasto.setData(rs.getDate("data_gasto").toLocalDate());
                gasto.setIdUsuario(rs.getInt("USUARIO_ID_USUARIO"));
                lista.add(gasto);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar gastos: " + e.getMessage());
        }

        return lista;
    }


}
