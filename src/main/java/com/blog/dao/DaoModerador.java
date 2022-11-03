package com.blog.dao;

import com.blog.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoModerador {

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
