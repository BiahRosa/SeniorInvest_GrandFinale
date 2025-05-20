package br.dev.biah.seniorinvest.dao;

import br.dev.biah.seniorinvest.model.Usuario;

public interface UsuarioDAO {
    boolean validarUsuario(Usuario usuario);
    void insert(Usuario usuario);

    Usuario buscarPorEmail(String email);
}
