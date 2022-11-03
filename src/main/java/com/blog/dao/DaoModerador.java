package com.blog.dao;

import com.blog.entidades.Moderador;
import com.blog.entidades.Usuario;
import com.blog.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoModerador {

    public static Moderador consultarPorUser(String mod) {
        Connection con = Conexao.conectar();
        Moderador moderador = new Moderador();

        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from moderadores where usuario = ?");
                stm.setString(1, mod);
                ResultSet rs = stm.executeQuery();

                if(rs.next()){
                    moderador.setId(rs.getInt("id"));
                    moderador.setEmail(rs.getString("email"));
                    moderador.setSenha(rs.getString("email"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return moderador;
    }

    public static boolean podeLogar(String user, String senha) {
        Connection con = Conexao.conectar();
        String sql = "select * from moderadores where usuario = ? and senha = ?";

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
