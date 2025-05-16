package br.dev.biah.seniorinvest.controller;

import br.dev.biah.seniorinvest.dao.impl.OracleReceitaDAO;
import br.dev.biah.seniorinvest.model.Receita;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/receita")
public class ReceitaServlet extends HttpServlet {
    private OracleReceitaDAO dao = new OracleReceitaDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Receita receita = new Receita();
        receita.setOrigem(req.getParameter("origem"));
        receita.setValor(Double.parseDouble(req.getParameter("valor")));
        receita.setData(LocalDate.parse(req.getParameter("data")));
        receita.setIdUsuario(1);

        dao.insert(receita);
        resp.sendRedirect("receita");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Receita> receitas = dao.getAll();
        req.setAttribute("receitas", receitas);
        req.getRequestDispatcher("receita/listar-receitas.jsp").forward(req, resp);
    }
}
