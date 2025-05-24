package br.dev.biah.seniorinvest.dao;

import br.dev.biah.seniorinvest.model.Usuario;

public interface UsuarioDAO {
    void insert(Usuario usuario);
    boolean validarUsuario(Usuario usuario);
    Usuario buscarPorEmail(String email);
    Usuario buscarPorId(int id);
}