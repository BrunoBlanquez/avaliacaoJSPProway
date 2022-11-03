package com.blog.dao;

import com.blog.entidades.Usuario;
import com.blog.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoUsuario {

    public static Usuario consultarPorUser(String user) {
        Connection con = Conexao.conectar();
        Usuario usuario = new Usuario();

        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuarios where usuario = ?");
                stm.setString(1, user);
                ResultSet rs = stm.executeQuery();

                if(rs.next()){
                    usuario.setId(rs.getInt("id"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setSenha(rs.getString("email"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return usuario;
    }

    public static String salvar(Usuario usuario) {
        Connection con = Conexao.conectar();

        if(con != null) {
            String sql = "insert into usuarios(nome, email, usuario, senha) values(?,?,?,?)";

            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, usuario.getNome());
                stm.setString(2, usuario.getEmail());
                stm.setString(3, usuario.getUsuario());
                stm.setString(4, usuario.getSenha());

                stm.execute();
            } catch (SQLException e) {
                return "Erro: " + e.getMessage();
            }
            return "Usuário salvo com sucesso";
        }
        return "Erro de conexão";
    }

    public static boolean podeLogar(String user, String senha) {
        Connection con = Conexao.conectar();
        String sql = "select * from usuarios where usuario = ? and senha = ?";

        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, user);
                stm.setString(2, senha);

                ResultSet rs = stm.executeQuery();
                return rs.next();
            } catch(SQLException e) {
                System.out.println("Erro: " + e.getMessage());
            }
        }
        return true;
    }
}
