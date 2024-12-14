using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Quiz1.CapaLogica;
using Quiz1.CapaModelo;

namespace Quiz1.CapaVistas
{
    public partial class Class : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }
        }

        private void LlenarGrid()
        {
            try
            {
                List<Cls_Class> clases = Business_Class.ObtenerClases();
                GridView1.DataSource = clases;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al cargar las clases: " + ex.Message);
            }
        }

        protected void bconsultar_Click(object sender, EventArgs e)
        {
            try
            {
                if (int.TryParse(tcodigo.Text, out int codigo))
                {
                    List<Cls_Class> clases = Business_Class.ObtenerClasesFiltro(codigo);
                    GridView1.DataSource = clases;
                    GridView1.DataBind();
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

        protected void baagregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(tnombre.Text))
                {
                    if (Business_Class.AgregarClass(tnombre.Text) > 0)
                    {
                        MostrarAlerta("Clase ingresada correctamente.");
                        LlenarGrid();
                    }
                    else
                    {
                        MostrarAlerta("Error al ingresar la clase.");
                    }
                }
                else
                {
                    MostrarAlerta("El nombre de la clase no puede estar vacío.");
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al agregar la clase: " + ex.Message);
            }
        }

        private void MostrarAlerta(string mensaje)
        {
            string script = $"alert('{mensaje.Replace("'", "\\'")}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "Alert", script, true);
        }
    }
}