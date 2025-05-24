package br.dev.biah.seniorinvest.controller;

import br.dev.biah.seniorinvest.dao.impl.OracleContaDAO;
import br.dev.biah.seniorinvest.model.Conta;

import br.dev.biah.seniorinvest.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/conta")
public class ContaServlet extends HttpServlet {
    private OracleContaDAO dao = new OracleContaDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Conta conta = new Conta();
        conta.setTipoConta(req.getParameter("tipoConta"));
        conta.setNomeConta(req.getParameter("nomeConta"));
        conta.setSaldo(Double.parseDouble(req.getParameter("saldo")));
        conta.setInstituicao(req.getParameter("instituicao"));
        conta.setDataCriacao(LocalDate.now());

        HttpSession session = req.getSession(); //só a conta logada vai ver
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        conta.setIdUsuario(usuario.getId());

        dao.insert(conta);
        resp.sendRedirect("conta");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        List<Conta> contas = dao.buscarPorUsuario(usuario.getId());
        req.setAttribute("contas", contas);
        req.getRequestDispatcher("conta/listar-contas.jsp").forward(req, resp);

        int idUsuario = ((Usuario) req.getSession().getAttribute("usuarioLogado")).getId();
        double saldoTotal = dao.calcularSaldoTotalPorUsuario(idUsuario);
        req.setAttribute("saldoTotal", saldoTotal);

    }
}
