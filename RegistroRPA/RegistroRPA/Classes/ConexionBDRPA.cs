  using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RegistroRPA.Classes
{
    public class ConexionBDRPA
    {
        
        //declaracion de variables de consulta de bd
        private SqlCommand sqlcommand;
        private SqlDataReader sqldatareader;
        private string usuarios = "select * from Tarjeta_RPA where usuario = @usuario and password = @password";
        private string correosBD = "select email from Tarjeta_RPA where usuario = @usuario";
        private string strCon = "Data Source=win-sqlserv-02;Initial Catalog=Registro_RPA;User ID=adminsql;Password=sistema*-!;";
        public String[] usuarioPassword(string usuarioIngresado, string passwordIngresado) {
          //declaracion de cadenas donde se devolveran valores consultados
            string usuarioBD = "";
            string passwordBD = "";
            string nivelaccesoBD = "";
            string autorizadoBD = "";
            string correo = "";
         //declaracion de conexion
            SqlConnection con = new SqlConnection();
            con.ConnectionString = strCon;
            con.Open();
            sqlcommand = new SqlCommand(usuarios, con);
         //declaracion de validaciones de parametros

            if (String.IsNullOrEmpty(usuarioIngresado))
            {
                sqlcommand.Parameters.AddWithValue("@usuario", "");
            }
            else
            {
                sqlcommand.Parameters.AddWithValue("@usuario", usuarioIngresado);
            }
            if (String.IsNullOrEmpty(passwordIngresado))
            {
                sqlcommand.Parameters.AddWithValue("@password", "");
            }
            else 
            {
                sqlcommand.Parameters.AddWithValue("@password", passwordIngresado);
            }
            //consulta de sql en la bd y asignacion de variables con datos
            sqldatareader = sqlcommand.ExecuteReader();
            while (sqldatareader.Read())
            {
                usuarioBD = sqldatareader.GetValue(1).ToString();
                passwordBD = sqldatareader.GetValue(2).ToString();
                nivelaccesoBD = sqldatareader.GetValue(10).ToString();
                autorizadoBD = sqldatareader.GetValue(11).ToString();
                correo = sqldatareader.GetValue(5).ToString();
                             
            }
            con.Close();

            if (usuarioBD == null || passwordBD == null || nivelaccesoBD == null || autorizadoBD == null || correo== null)
            {
                return new String[] { "", "" ,"",""};
            }
            else if (usuarioBD.Equals("") || passwordBD.Equals("") || nivelaccesoBD.Equals("") || autorizadoBD.Equals("") || correo.Equals(""))
            {
                return new String[] { "", "","",""};
            }
            else {
                return new String[] { usuarioBD, passwordBD, nivelaccesoBD, autorizadoBD, correo};
            }


           
          }
        public String consultarCorreoUsuario(string usuario) {
            string correoConsultado = "";

            SqlConnection con = new SqlConnection();
            con.ConnectionString = strCon;
            con.Open();
            sqlcommand = new SqlCommand(correosBD, con);
             if (String.IsNullOrEmpty(usuario))
            {
                sqlcommand.Parameters.AddWithValue("@usuario", "");
            }
            else
            {
                sqlcommand.Parameters.AddWithValue("@usuario",usuario);
            }
            sqldatareader = sqlcommand.ExecuteReader();
            
            while (sqldatareader.Read())
            {
               correoConsultado = sqldatareader.GetValue(0).ToString();
            }
            con.Close();
            
            return correoConsultado;
        }
        public String consultarID() {

            string id_consulta = "SELECT * FROM [Registro_RPA].[dbo].[Antecedentes_RPA] WHERE ID";
                    id_consulta = id_consulta +" =( SELECT MAX(ID) FROM [Registro_RPA].[dbo].[Antecedentes_RPA])";
            string id_consultado="";

            //declaracion de conexion
            SqlConnection con = new SqlConnection();
            con.ConnectionString = strCon;
            con.Open();
            sqlcommand = new SqlCommand(id_consulta, con);
            //declaracion de validaciones de parametros

            sqldatareader = sqlcommand.ExecuteReader();
            while (sqldatareader.Read())
            {
                id_consultado = sqldatareader.GetValue(0).ToString();
            }
            con.Close();

            return id_consultado;
        
        }


    }
}