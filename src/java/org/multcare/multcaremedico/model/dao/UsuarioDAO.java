package org.multcare.multcaremedico.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.multcare.multcaremedico.model.bean.Usuario;
import org.multcare.multcaremedico.model.connection.ConnectionFactory;

/**
 *
 * @author Gyovanne Cavalcanti
 */
public class UsuarioDAO implements Validar {

    private Connection con = null;

    /**
     *
     */
    public UsuarioDAO() {
        con = ConnectionFactory.getConnection();
    }

    /**
     *
     * @param usuario
     * @return
     */
    public boolean adicionarUsuario(Usuario usuario) {
        String sql = "insert into usuario (nome, sobrenome, crm, endereco, telefone, email, senha)values(?,?,?,?,?,?,?)";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);

            ps.setString(1, usuario.getNomeUsuario());
            ps.setString(2, usuario.getSobrenomeUsuario());
            ps.setString(3, usuario.getCrmUsuario());
            ps.setString(4, usuario.getEnderecoUsuario());
            ps.setString(5, usuario.getTelefoneUsuario());
            ps.setString(6, usuario.getEmailUsuario());
            ps.setString(7, usuario.getSenhaUsuario());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println(e.getLocalizedMessage());
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, ps);
        }
    }

    /**
     *
     * @param usuario
     * @return
     */
    public boolean atualizarUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET nome = ?, sobrenome = ?, crm = ?, endereco = ?, telefone = ?, email = ?, senha = ? WHERE id = ?";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getNomeUsuario());
            ps.setString(2, usuario.getSobrenomeUsuario());
            ps.setString(3, usuario.getCrmUsuario());
            ps.setString(4, usuario.getEnderecoUsuario());
            ps.setString(5, usuario.getTelefoneUsuario());
            ps.setString(6, usuario.getEmailUsuario());
            ps.setString(7, usuario.getSenhaUsuario());

            ps.setInt(8, usuario.getIdUsuario());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println(e.getLocalizedMessage());
            return false;
        } finally {
            ConnectionFactory.closeConnection(con, ps);
        }
    }

    /**
     *
     * @return
     */
    public boolean verificarCadastro() {
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM usuario WHERE email = ?";
        String email = null;
        ResultSet rs;
        boolean chave = false;
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            chave = !rs.next();
        } catch (SQLException ex) {
            System.err.println(ex.getLocalizedMessage());
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }
        return chave;
    }

    /**
     *
     * @param usuario
     * @return
     */
    @Override
    public Usuario validarUsuario(Usuario usuario) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM usuario WHERE email = ? and senha = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario.getEmailUsuario());
            stmt.setString(2, usuario.getSenhaUsuario());
            rs = stmt.executeQuery();
            int r = 0;
            Usuario u = new Usuario();
            if (rs.next()) {
                r = r + 1;
                u.setIdUsuario(rs.getInt("id"));
                u.setNomeUsuario(rs.getString("nome"));
                u.setSobrenomeUsuario(rs.getString("sobrenome"));
                u.setCrmUsuario(rs.getString("crm"));
                u.setEnderecoUsuario(rs.getString("endereco"));
                u.setTelefoneUsuario(rs.getString("telefone"));
                u.setEmailUsuario(rs.getString("email"));
                u.setSenhaUsuario(rs.getString("senha"));
            }
            if (r == 1) {
                return u;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getLocalizedMessage());
            return null;
        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
    }

    /**
     *
     * @param idUsuario
     * @return
     */
    public List<Usuario> listarUsuarios(int idUsuario) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Usuario> usuarios = new ArrayList<>();
        try {
            stmt = con.prepareStatement("SELECT * FROM usuario order by (nome)");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                if (rs.getInt("id") != idUsuario) {
                    usuario.setIdUsuario(rs.getInt("id"));
                    usuario.setNomeUsuario(rs.getString("nome"));
                    usuario.setSobrenomeUsuario(rs.getString("sobrenome"));
                    usuario.setCrmUsuario(rs.getString("crm"));
                    usuario.setEnderecoUsuario(rs.getString("endereco"));
                    usuario.setTelefoneUsuario(rs.getString("telefone"));
                    usuario.setEmailUsuario(rs.getString("email"));
                    usuario.setSenhaUsuario(rs.getString("senha"));
                    usuarios.add(usuario);
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getLocalizedMessage());
        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        return usuarios;
    }
}
