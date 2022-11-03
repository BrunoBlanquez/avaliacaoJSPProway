package com.blog.dao;

import com.blog.entidades.Post;
import com.blog.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoPost {

    public static String salvar(Post post) {
        Connection con = Conexao.conectar();

        if(con != null) {
            String sql = "insert into post(titulo, descricao) values(?,?)";

            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, post.getTitulo());
                stm.setString(2, post.getDescricao());

                stm.execute();
            } catch (SQLException e) {
                return "Erro: " + e.getMessage();
            }
            return "Post criado com sucesso";
        }
        return "Erro de conexão";
    }

    public static List<Post> listarPostagens() {
        List<Post> lista = new ArrayList<Post>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from post");
                ResultSet rs = stm.executeQuery();
                while(rs.next()) {
                    Post p = new Post();
                    p.setId(rs.getInt("id"));
                    p.setTitulo(rs.getString("titulo"));
                    p.setDescricao(rs.getString("descricao"));

                    lista.add(p);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }
    public static List<Post> listarDezPostagens() {
        List<Post> lista = new ArrayList<Post>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from post limit 10");
                ResultSet rs = stm.executeQuery();
                while(rs.next()) {
                    Post p = new Post();
                    p.setId(rs.getInt("id"));
                    p.setTitulo(rs.getString("titulo"));
                    p.setDescricao(rs.getString("descricao"));

                    lista.add(p);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static Post consultarIndividual(int idPost) {
        Connection con = Conexao.conectar();
        Post p = new Post();
        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from post where id = ?");
                stm.setInt(1, idPost);
                ResultSet rs = stm.executeQuery();
                if(rs.next()) {
                    p.setId(rs.getInt("id"));
                    p.setTitulo(rs.getString("titulo"));
                    p.setDescricao(rs.getString("descricao"));
                }
            } catch (SQLException e) {
                return p;
            }
        }
        return p;
    }

    public static String alterar(Post p) {
        Connection con = Conexao.conectar();
        if(con != null) {
            String sql = "update post set titulo = ?, descricao = ? where id = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, p.getTitulo());

                stm.setString(2, p.getDescricao());
                stm.setInt(3, p.getId());
                stm.execute();
                System.out.println(p.getTitulo());
                System.out.println(p.getDescricao());
                System.out.println(p.getId());
                return "Registro alterado com sucesso";
            } catch (SQLException e) {
                return "Não foi possível alterar registro";
            }
        }
        return "erro de conexão";
    }

    public static void excluir(int id) {
        Connection con = Conexao.conectar();
        if(con != null) {
            String sql = "delete from post where id = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                stm.execute();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
