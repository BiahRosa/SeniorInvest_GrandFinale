package br.dev.biah.seniorinvest.controller;

import br.dev.biah.seniorinvest.dao.UsuarioDAO;
import br.dev.biah.seniorinvest.dao.impl.OracleUsuarioDAO;
import br.dev.biah.seniorinvest.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UsuarioDAO dao = new OracleUsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        Usuario usuario = new Usuario();
        usuario.setEmail(email);
        usuario.setSenha(senha);

        if (dao.validarUsuario(usuario)) {
            HttpSession session = req.getSession();

            Usuario completo = dao.buscarPorEmail(email);
            session.setAttribute("usuarioLogado", completo);


            resp.sendRedirect("home.jsp");
        } else {
            req.setAttribute("erro", "Usuário ou senha inválidos.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
