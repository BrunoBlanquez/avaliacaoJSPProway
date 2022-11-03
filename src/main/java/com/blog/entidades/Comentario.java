package com.blog.entidades;

public class Comentario {
    private int idComentario;
    private String comentario;
    private int usuarioComentario;
    private int idPost;
    private boolean autorizado = false;

    public Comentario() {
    }

    public Comentario(String comentario, int usuarioComentario, int idPost) {
        this.comentario = comentario;
        this.usuarioComentario = usuarioComentario;
        this.idPost = idPost;
    }

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getUsuarioComentario() {
        return usuarioComentario;
    }

    public void setUsuarioComentario(int usuarioComentario) {
        this.usuarioComentario = usuarioComentario;
    }

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public boolean isAutorizado() {
        return autorizado;
    }

    public void setAutorizado(boolean autorizado) {
        this.autorizado = autorizado;
    }

}
