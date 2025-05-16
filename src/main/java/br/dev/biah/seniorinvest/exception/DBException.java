package br.dev.biah.seniorinvest.exception;

public class DBException extends Exception {

    public DBException() { }

    public DBException(String message) {
        super(message);
    }

    public DBException(String message, Throwable cause) {
        super(message, cause);
    }
}
