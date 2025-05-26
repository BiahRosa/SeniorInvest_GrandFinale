package br.dev.biah.seniorinvest.controller;

import br.dev.biah.seniorinvest.dao.impl.OracleGastoDAO;
import br.dev.biah.seniorinvest.dao.impl.OracleReceitaDAO;
import br.dev.biah.seniorinvest.model.Gasto;
import br.dev.biah.seniorinvest.model.Movimento;
import br.dev.biah.seniorinvest.model.Receita;
import br.dev.biah.seniorinvest.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet("/extrato")
public class ExtratoServlet extends HttpServlet {

    private OracleReceitaDAO receitaDAO = new OracleReceitaDAO();
    private OracleGastoDAO gastoDAO = new OracleGastoDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Usuario usuario = (Usuario) req.getSession().getAttribute("usuarioLogado");
        if (usuario == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        int idUsuario = usuario.getId();

        List<Movimento> lista = new ArrayList<>();
        for (Receita r : receitaDAO.buscarPorUsuario(idUsuario)) {
            lista.add(new Movimento("Receita", r.getData(), r.getOrigem(), r.getValor()));
        }

        for (Gasto g : gastoDAO.buscarPorUsuario(idUsuario)) {
            lista.add(new Movimento("Gasto", g.getData(), g.getDescricao(), g.getValor()));
        }

        //por data
        lista.sort(Comparator.comparing(Movimento::getData).reversed());

        req.setAttribute("movimentos", lista);
        req.getRequestDispatcher("/telas/extrato.jsp").forward(req, resp);
    }
}
