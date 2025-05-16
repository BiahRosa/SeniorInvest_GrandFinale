package br.dev.biah.seniorinvest.controller;

import br.dev.biah.seniorinvest.dao.impl.OracleUsuarioDAO;
import br.dev.biah.seniorinvest.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {
    private OracleUsuarioDAO dao = new OracleUsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Usuario usuario = new Usuario();
        usuario.setNome(req.getParameter("nome"));
        usuario.setEmail(req.getParameter("email"));
        usuario.setSenha(req.getParameter("senha"));

        dao.insert(usuario);
        resp.sendRedirect("cadastro");
    }
}
