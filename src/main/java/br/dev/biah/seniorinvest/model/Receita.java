package br.dev.biah.seniorinvest.model;

import java.time.LocalDate;

public class Receita {
    private int id;
    private String origem;
    private double valor;
    private LocalDate data;
    private int idUsuario;

    public Receita() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getOrigem() { return origem; }
    public void setOrigem(String origem) { this.origem = origem; }

    public double getValor() { return valor; }
    public void setValor(double valor) { this.valor = valor; }

    public LocalDate getData() { return data; }
    public void setData(LocalDate data) { this.data = data; }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }
}
