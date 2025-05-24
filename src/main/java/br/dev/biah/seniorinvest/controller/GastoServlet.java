package br.dev.biah.seniorinvest.controller;

import br.dev.biah.seniorinvest.dao.impl.OracleGastoDAO;
import br.dev.biah.seniorinvest.model.Gasto;

import br.dev.biah.seniorinvest.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/gasto")
public class GastoServlet extends HttpServlet {
    private OracleGastoDAO dao = new OracleGastoDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Gasto gasto = new Gasto();
        gasto.setDescricao(req.getParameter("descricao"));
        gasto.setValor(Double.parseDouble(req.getParameter("valor")));
        gasto.setData(LocalDate.parse(req.getParameter("data")));

        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        gasto.setIdUsuario(usuario.getId());

        dao.insert(gasto);
        resp.sendRedirect("gasto");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        List<Gasto> gastos = dao.buscarPorUsuario(usuario.getId());
        req.setAttribute("gastos", gastos);
        req.getRequestDispatcher("gasto/listar-gastos.jsp").forward(req, resp);
    }
}
