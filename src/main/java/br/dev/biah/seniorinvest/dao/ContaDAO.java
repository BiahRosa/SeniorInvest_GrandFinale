package br.dev.biah.seniorinvest.dao;

import br.dev.biah.seniorinvest.model.Conta;
import java.util.List;

public interface ContaDAO {
    void insert(Conta conta);
    List<Conta> getAll();
}
