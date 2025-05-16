package br.dev.biah.seniorinvest.controller;

import br.dev.biah.seniorinvest.dao.impl.OracleGastoDAO;
import br.dev.biah.seniorinvest.model.Gasto;

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
        gasto.setIdUsuario(1); // tem no banco

        dao.insert(gasto);
        resp.sendRedirect("gasto");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Gasto> gastos = dao.getAll();
        req.setAttribute("gastos", gastos);
        req.getRequestDispatcher("gasto/listar-gastos.jsp").forward(req, resp);
    }
}
