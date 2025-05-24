package br.dev.biah.seniorinvest.dao.impl;

import br.dev.biah.seniorinvest.dao.UsuarioDAO;
import br.dev.biah.seniorinvest.factory.ConnectionFactory;
import br.dev.biah.seniorinvest.model.Usuario;

import java.sql.*;

public class OracleUsuarioDAO implements UsuarioDAO {

    @Override
    public void insert(Usuario usuario) {
        String sql = "INSERT INTO T_FIN_USUARIO (id_usuario, nome, email, senha) VALUES (seq_usuario.NEXTVAL, ?, ?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getEmail());
            ps.setString(3, usuario.getSenha());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Erro ao inserir usuário: " + e.getMessage());
        }
    }

    @Override
    public boolean validarUsuario(Usuario usuario) {
        String sql = "SELECT * FROM T_FIN_USUARIO WHERE email = ? AND senha = ?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, usuario.getEmail());
            ps.setString(2, usuario.getSenha());

            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            System.err.println("Erro ao validar usuário: " + e.getMessage());
            return false;
        }
    }

    @Override
    public Usuario buscarPorEmail(String email) {
        Usuario usuario = null;
        String sql = "SELECT * FROM T_FIN_USUARIO WHERE email = ?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
            }

        } catch (SQLException e) {
            System.err.println("Erro ao buscar usuário por e-mail: " + e.getMessage());
        }

        return usuario;
    }

    public Usuario buscarPorId(int id) {
        Usuario usuario = null;
        String sql = "SELECT * FROM T_FIN_USUARIO WHERE id_usuario = ?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            System.out.println("Buscando usuário com ID: " + id); // Teste 1

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("Usuário encontrado: " + rs.getString("nome")); // Teste 2
                usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
            } else {
                System.out.println("Nenhum usuário encontrado com esse ID.");
            }

        } catch (SQLException e) {
            System.err.println("Erro ao buscar usuário por ID: " + e.getMessage());
        }

        return usuario;
    }
}