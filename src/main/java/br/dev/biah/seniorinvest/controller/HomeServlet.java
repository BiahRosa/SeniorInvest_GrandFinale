package br.dev.biah.seniorinvest.controller;

import br.dev.biah.seniorinvest.dao.impl.OracleGastoDAO;
import br.dev.biah.seniorinvest.dao.impl.OracleReceitaDAO;
import br.dev.biah.seniorinvest.model.Conta;
import br.dev.biah.seniorinvest.model.Gasto;
import br.dev.biah.seniorinvest.model.Receita;
import br.dev.biah.seniorinvest.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

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

        List<Receita> receitas = receitaDAO.buscarPorUsuario(idUsuario);
        List<Gasto> gastos = gastoDAO.buscarPorUsuario(idUsuario);

        double totalReceitas = receitas.stream().mapToDouble(Receita::getValor).sum();
        double totalGastos = gastos.stream().mapToDouble(Gasto::getValor).sum();
        double saldo = totalReceitas - totalGastos;

        NumberFormat formatoBR = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
        String saldoFormatado = formatoBR.format(saldo); // 1.000,00 assim

        req.setAttribute("saldoTotal", saldoFormatado);
        req.getRequestDispatcher("/home.jsp").forward(req, resp);
    }
}
