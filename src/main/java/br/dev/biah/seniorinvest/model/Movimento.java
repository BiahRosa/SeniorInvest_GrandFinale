package br.dev.biah.seniorinvest.model;

import java.time.LocalDate;

public class Movimento {
    private String tipo;
    private LocalDate data;
    private String descricao;
    private double valor;

    public Movimento(String tipo, LocalDate data, String descricao, double valor) {
        this.tipo = tipo;
        this.data = data;
        this.descricao = descricao;
        this.valor = valor;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getTipo() { return tipo; }
    public LocalDate getData() { return data; }
    public String getDescricao() { return descricao; }
    public double getValor() { return valor; }
}
