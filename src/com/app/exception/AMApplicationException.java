package com.app.exception;

public class AMApplicationException extends RuntimeException {

    private String message;

    public AMApplicationException(String message) {
        super(message);
        this.message = message;

    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
