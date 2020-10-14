package Modelo;

import Auxiliar.Constantes;
import java.sql.*;
import java.util.HashMap;
import java.util.LinkedList;
import javax.swing.JOptionPane;

public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;


    public static void nueva(){
        try {
         //Cargar el driver/controlador
            String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);

            String URL_BD = "jdbc:mysql://localhost/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";

            //Realizamos la conexión a una BD con un usuario y una clave.
            Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }
    
    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    
    
//    public static Persona existeUsuario(String usuario) {
//        Persona existe = null;
//        try {
//            //String sentencia = "SELECT * FROM personas WHERE Nombre =? ";
//            //Preparamos la sentencia para evitar la inyección.
////            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
////            sentenciaPreparada.setString(1, usuario);
////            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();
//            
//            //http://www.mclibre.org/consultar/php/lecciones/php-db-inyeccion-sql.html
//            //Código para inyectar -->   ' or '1'='1
//            String sentencia = "SELECT * FROM personas WHERE Nombre ='"+ usuario +"' ";
//            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
//
//            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
//            {
//                existe = new Persona(Conj_Registros.getString("DNI"), Conj_Registros.getString("nombre"), Conj_Registros.getInt("Tfno"));
//            }
//        } catch (SQLException ex) {
//            System.out.println("Error en el acceso a la BD.");
//        }
//        return existe;//Si devolvemos null el usuario no existe.
//    }

  
    
    /**
     * Usando una LinkedList.
     * @return 
     */
//    public static LinkedList obtenerPersonas() {
//        LinkedList personasBD = new LinkedList<>();
//        Persona p = null;
//        try {
//            String sentencia = "SELECT * FROM personas";
//            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
//            while(Conj_Registros.next()){
//                p =new Persona(Conj_Registros.getString("mail"), Conj_Registros.getString("user"), Conj_Registros.getString("pass"), Conj_Registros.getInt("rango"));;
//                personasBD.add(p);
//            }
//        } catch (SQLException ex) {
//        }
//        return personasBD;
//    }
    
    /**
     * Usando una tabla Hash.
     * @return 
     */
//    public static HashMap<String, Persona> obtenerPersonas2() {
//        HashMap <String, Persona> personos = new HashMap<String, Persona>();
//        Persona p = null;
//        try {
//            String sentencia = "SELECT * FROM personas";
//            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
//            while(Conj_Registros.next()){
//                p =new Persona(Conj_Registros.getString("DNI"), Conj_Registros.getString("nombre"), Conj_Registros.getInt("Tfno"));;
//                personos.put(p.getDNI(), p);
//            }
//        } catch (SQLException ex) {
//        }
//        return personos;
//    }

    //----------------------------------------------------------
    public static void Insertar_Dato(String mail, String user, String pass) throws SQLException {
        String Sentencia = "INSERT INTO personas VALUES ('" + mail + "'," + "'" + user + "','" + pass + "',0)";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public static Usuarios existeUsuario(String mail,String pass) {
        Usuarios existe = null;
        try {
            String sentencia = "SELECT * FROM usuarios WHERE mail = '" + mail + "' and pass = '" + pass + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuarios(Conj_Registros.getString("mail"), Conj_Registros.getString("pass"), Conj_Registros.getString("nombre"), Conj_Registros.getString("sexo"), Conj_Registros.getInt("rol"), Conj_Registros.getInt("activo"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }
    
    //----------------------------------------------------------
//    public static Persona recuperarUsuario(String mail,String user) {
//        Persona existe = null;
//        try {
//            String sentencia = "SELECT * FROM personas WHERE mail = '" + mail + "' and user = '" + user + "'";
//            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
//            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
//            {
//                existe = new Persona(Conj_Registros.getString("mail"), Conj_Registros.getString("user"), Conj_Registros.getString("pass"), Conj_Registros.getInt("rango"));
//            }
//        } catch (SQLException ex) {
//            System.out.println("Error en el acceso a la BD.");
//        }
//        return existe;//Si devolvemos null el usuario no existe.
//    }

    //----------------------------------------------------------
    public void Borrar_Dato(String tabla, String DNI) throws SQLException {
        String Sentencia = "DELETE FROM " + tabla + " WHERE DNI = '" + DNI + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }

}
