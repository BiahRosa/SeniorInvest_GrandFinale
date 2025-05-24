package br.dev.biah.seniorinvest.dao.impl;

import br.dev.biah.seniorinvest.dao.ReceitaDAO;
import br.dev.biah.seniorinvest.factory.ConnectionFactory;
import br.dev.biah.seniorinvest.model.Receita;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OracleReceitaDAO implements ReceitaDAO {

    @Override
    public void insert(Receita receita) {
        String sql = "INSERT INTO T_FIN_RECEITA (id_receita, origem, valor, data_receita, USUARIO_ID_USUARIO) " +
                "VALUES (seq_receita.NEXTVAL, ?, ?, ?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, receita.getOrigem());
            ps.setDouble(2, receita.getValor());
            ps.setDate(3, Date.valueOf(receita.getData()));
            ps.setInt(4, receita.getIdUsuario());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Erro ao inserir receita: " + e.getMessage());
        }
    }

    @Override
    public List<Receita> getAll() {
        List<Receita> lista = new ArrayList<>();
        String sql = "SELECT * FROM T_FIN_RECEITA";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Receita receita = new Receita();
                receita.setId(rs.getInt("id_receita"));
                receita.setOrigem(rs.getString("origem"));
                receita.setValor(rs.getDouble("valor"));
                receita.setData(rs.getDate("data_receita").toLocalDate());
                receita.setIdUsuario(rs.getInt("USUARIO_ID_USUARIO"));
                lista.add(receita);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar receitas: " + e.getMessage());
        }

        return lista;
    }

    public List<Receita> buscarPorUsuario(int idUsuario) {
        List<Receita> lista = new ArrayList<>();
        String sql = "SELECT * FROM T_FIN_RECEITA WHERE USUARIO_ID_USUARIO = ?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Receita receita = new Receita();
                receita.setId(rs.getInt("id_receita"));
                receita.setOrigem(rs.getString("origem"));
                receita.setValor(rs.getDouble("valor"));
                receita.setData(rs.getDate("data_receita").toLocalDate());
                receita.setIdUsuario(rs.getInt("USUARIO_ID_USUARIO"));
                lista.add(receita);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar receitas do usuário: " + e.getMessage());
        }

        return lista;
    }


}
