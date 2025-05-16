package br.dev.biah.seniorinvest.dao;

import br.dev.biah.seniorinvest.model.Receita;
import java.util.List;

public interface ReceitaDAO {
    void insert(Receita receita);
    List<Receita> getAll();
}
