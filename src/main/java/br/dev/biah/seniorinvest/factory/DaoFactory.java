package br.dev.biah.seniorinvest.factory;

import br.dev.biah.seniorinvest.dao.*;
import br.dev.biah.seniorinvest.dao.impl.*;

public class DaoFactory {
    public static UsuarioDAO getUsuarioDAO() {
        return new OracleUsuarioDAO();
    }

    public static ContaDAO getContaDAO() {
        return new OracleContaDAO();
    }

    public static GastoDAO getGastoDAO() {
        return new OracleGastoDAO();
    }

    public static ReceitaDAO getReceitaDAO() {
        return new OracleReceitaDAO();
    }
}
