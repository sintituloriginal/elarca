using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ARCA.Service;

namespace ARCA.View.Components
{
    public partial class component_departamento : System.Web.UI.UserControl
    {
        private QueryCategoria accesodepartamento = new QueryCategoria();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idTablacat.DataSource = accesodepartamento.MostrarCategoria();
                idTablacat.DataBind();
            }
        }

        protected void idEliminarcat_Click(object sender, EventArgs e)
        {

        }

        protected void idEditarcat_Click(object sender, EventArgs e)
        {
            try
            {
                alerta.Visible = true;
                alerta.CssClass = "alert alert-success animated zoomInUp";
                Mensaje.Text = "Departamento actualizado";
                String nombre = tnombrecat.Text;
                String codigo_original = idcat_original.Text;
                accesodepartamento.editarDepartamento(new Models.departamento
                {
                    nombredepartamento = nombre
                }, codigo_original);
                idTablacat.DataSource = accesodepartamento.MostrarCategoria();
                idTablacat.DataBind();
            }
            catch (Exception)
            {

                alerta.Visible = true;
                alerta.CssClass = "alert alert-danger animated zoomInUp";
                Mensaje.Text = "Error al actualizar :(";
            }
        }

        protected void idAgregarcat_Click(object sender, EventArgs e)
        {
            try
            {
                alerta.Visible = true;
                alerta.CssClass = "alert alert-success animated zoomInUp";
                Mensaje.Text = "Departamento agregado";
                string nombredep = tnombrecat.Text;
                accesodepartamento.addDepartamento(new Models.departamento
                {
                    nombredepartamento=nombredep
                });
                idTablacat.DataSource = accesodepartamento.MostrarCategoria();
                idTablacat.DataBind();
            }
            catch (Exception)
            {

                alerta.Visible = true;
                alerta.CssClass = "alert alert-danger animated zoomInUp";
                Mensaje.Text = "Departamento no agregado :(";
            }
        }

        

        protected void bBuscarCat_Click(object sender, EventArgs e)
        {
            try
            {
                alerta.Visible = false;
                int filtro = Convert.ToInt32(idOpciones.SelectedValue);
                int cant = accesodepartamento.BuscarDepartamento(tDatoBuscarcat.Text, filtro).Count;
                idTablacat.DataSource = accesodepartamento.BuscarDepartamento(tDatoBuscarcat.Text, filtro);
                idTablacat.DataBind();
                if (cant == 0)
                {
                    alerta.Visible = true;
                    alerta.CssClass = "alert alert-danger animated zoomInUp";
                    Mensaje.Text = "Departamento no encontrado :(";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }




        protected void idTablacat_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                int filtro = Convert.ToInt32(idOpciones.SelectedValue);
                idTablacat.PageIndex = e.NewPageIndex;
                idTablacat.DataSource = accesodepartamento.BuscarDepartamento(tDatoBuscarcat.Text,filtro);
                idTablacat.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void idTablacat_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int fila = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("idseleccionarcat"))
            {
                idcat_original.Text = idTablacat.Rows[fila].Cells[0].Text;
                tnombrecat.Text = idTablacat.Rows[fila].Cells[1].Text;

            }
        }
    }
}