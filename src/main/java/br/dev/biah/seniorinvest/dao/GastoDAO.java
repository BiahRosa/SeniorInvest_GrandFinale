package br.dev.biah.seniorinvest.dao;

import br.dev.biah.seniorinvest.model.Gasto;
import java.util.List;

public interface GastoDAO {
    void insert(Gasto gasto);
    List<Gasto> getAll();
}
