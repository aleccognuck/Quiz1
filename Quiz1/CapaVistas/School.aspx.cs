using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Quiz1.CapaVistas
{
    public partial class School : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGridSchool();
            }
        }

        private void LlenarGridSchool()
        {
            try
            {
                GridViewEscuela.DataSource = ObtenerEscuelas();
                GridViewEscuela.DataBind();
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al cargar las escuelas: " + ex.Message);
            }
        }

        private DataTable ObtenerEscuelas()
        {
            using (SqlConnection conn = new SqlConnection("your_connection_string_here"))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM SCHOOL", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        protected void btnConsultarEscuela_Click(object sender, EventArgs e)
        {
            try
            {
                if (int.TryParse(txtCodigoEscuela.Text, out int codigo))
                {
                    GridViewEscuela.DataSource = ObtenerEscuelaPorId(codigo);
                    GridViewEscuela.DataBind();
                }
                else
                {
                    MostrarAlerta("El código ingresado no es válido.");
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al consultar: " + ex.Message);
            }
        }

        private DataTable ObtenerEscuelaPorId(int id)
        {
            using (SqlConnection conn = new SqlConnection("your_connection_string_here"))
            {
                SqlCommand cmd = new SqlCommand("Consulta", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        protected void btnAgregarEscuela_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(txtNombreEscuela.Text))
                {
                    if (InsertarEscuela(txtNombreEscuela.Text, "Descripción por defecto", "Dirección por defecto", "Teléfono por defecto", "Código postal por defecto", "Dirección postal por defecto"))
                    {
                        MostrarAlerta("Escuela ingresada correctamente.");
                        LlenarGridSchool();
                    }
                    else
                    {
                        MostrarAlerta("Error al ingresar la escuela.");
                    }
                }
                else
                {
                    MostrarAlerta("El nombre de la escuela no puede estar vacío.");
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al agregar la escuela: " + ex.Message);
            }
        }

        private bool InsertarEscuela(string nombre, string descripcion, string direccion, string telefono, string codigoPostal, string direccionPostal)
        {
            using (SqlConnection conn = new SqlConnection("your_connection_string_here"))
            {
                SqlCommand cmd = new SqlCommand("Insertar", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@SchoolName", nombre);
                cmd.Parameters.AddWithValue("@Description", descripcion);
                cmd.Parameters.AddWithValue("@Address", direccion);
                cmd.Parameters.AddWithValue("@Phone", telefono);
                cmd.Parameters.AddWithValue("@PostCode", codigoPostal);
                cmd.Parameters.AddWithValue("@PostAddress", direccionPostal);

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                conn.Close();

                return rowsAffected > 0;
            }
        }

        private void MostrarAlerta(string mensaje)
        {
            string script = $"alert('{mensaje.Replace("'", "\\'")}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "Alert", script, true);
        }
    }
}
