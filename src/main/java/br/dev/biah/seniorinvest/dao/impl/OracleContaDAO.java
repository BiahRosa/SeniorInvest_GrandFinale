package br.dev.biah.seniorinvest.dao.impl;

import br.dev.biah.seniorinvest.dao.ContaDAO;
import br.dev.biah.seniorinvest.factory.ConnectionFactory;
import br.dev.biah.seniorinvest.model.Conta;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OracleContaDAO implements ContaDAO {

    @Override
    public void insert(Conta conta) {
        String sql = "INSERT INTO T_FIN_CONTA (id_conta, tipo_conta, nome_conta, saldo, instituicao, data_criacao, USUARIO_ID_USUARIO) " +
                "VALUES (seq_conta.NEXTVAL, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, conta.getTipoConta());
            ps.setString(2, conta.getNomeConta());
            ps.setDouble(3, conta.getSaldo());
            ps.setString(4, conta.getInstituicao());
            ps.setDate(5, Date.valueOf(conta.getDataCriacao()));
            ps.setInt(6, conta.getIdUsuario());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Erro ao inserir conta: " + e.getMessage());
        }
    }

    @Override
    public List<Conta> getAll() {
        List<Conta> lista = new ArrayList<>();
        String sql = "SELECT * FROM T_FIN_CONTA";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Conta conta = new Conta();
                conta.setIdConta(rs.getInt("id_conta"));
                conta.setTipoConta(rs.getString("tipo_conta"));
                conta.setNomeConta(rs.getString("nome_conta"));
                conta.setSaldo(rs.getDouble("saldo"));
                conta.setInstituicao(rs.getString("instituicao"));

                Date dataCriacao = rs.getDate("data_criacao");
                if (dataCriacao != null) {
                    conta.setDataCriacao(dataCriacao.toLocalDate());
                }

                conta.setIdUsuario(rs.getInt("USUARIO_ID_USUARIO"));

                lista.add(conta);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar contas: " + e.getMessage());
        }

        return lista;
    }
}
