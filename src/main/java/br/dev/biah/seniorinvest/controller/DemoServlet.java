package br.dev.biah.seniorinvest.controller;

import br.dev.biah.seniorinvest.dao.impl.OracleUsuarioDAO;
import br.dev.biah.seniorinvest.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/demo")
public class DemoServlet extends HttpServlet {

    private OracleUsuarioDAO dao = new OracleUsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Usuario demo = dao.buscarPorId(9999);

        if (demo != null) {
            HttpSession session = req.getSession();
            session.setAttribute("usuarioLogado", demo);
            resp.sendRedirect("home.jsp");
        } else {
            System.out.println("Usuário DEMO (ID 9999) não encontrado no banco.");
            resp.sendRedirect("erro.jsp");
        }
    }
}