package com.blog.dao;

import com.blog.entidades.Comentario;
import com.blog.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoComentario {

    public static String salvar(Comentario comentario) {
        Connection con = Conexao.conectar();
        if(con != null) {
            String sql = "insert into comentarios(comentario, usuarioComentario, idPost, autorizado) value(?,?,?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, comentario.getComentario());
                stm.setInt(2, comentario.getUsuarioComentario());
                stm.setInt(3, comentario.getIdPost());
                stm.setBoolean(4, comentario.isAutorizado());
                stm.execute();
                return "Registro inserido com sucesso!";
            } catch (SQLException e) {
                return "Erro: " + e.getMessage();
            }
        }
        return "Erro de conexão!";
    }

    public static List<Comentario> consultarTodos() {
        List<Comentario> comentarios = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();

        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from comentarios");
                ResultSet rs = stm.executeQuery();

                while(rs.next()) {
                    Comentario comentario = new Comentario();
                    comentario.setIdComentario(rs.getInt("id"));
                    comentario.setComentario(rs.getString("comentario"));
                    comentario.setUsuarioComentario(rs.getInt("usuarioComentario"));
                    comentario.setIdPost(rs.getInt("idPost"));
                    comentario.setAutorizado(rs.getBoolean("autorizado"));
                    comentarios.add(comentario);
                }
            } catch (SQLException e ) {
                e.printStackTrace();
            }
        }
        return comentarios;
    }

    public static String aprovar(int idComentario) {
        Connection con = Conexao.conectar();

        if(con != null) {
            String sql = "update comentarios set autorizado = true where id = ?";

            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, idComentario);
                stm.execute();
                return "Registro alterado com sucesso!";
            } catch (SQLException e) {
                return "Não foi possível alterar";
            }
        }
        return "Erro de conexão";
    }
}
