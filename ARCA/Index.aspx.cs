using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ARCA.Service;

namespace ARCA
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    mcontenido.SetActiveView(vBienvenida);
                    if (!Session["id_usuario"].Equals("") || !Session["id_usuario"].Equals(null))
                    {
                        int idRol = Convert.ToInt32(Session["id_roles"]);
                        activaMenu(idRol);
                        ucontenido.Update();
                    }
                }
            }
            catch (Exception)
            {

                login.Visible = true;
            }
        }

        protected void Menu_inicio_Click(object sender, EventArgs e)
        {
            mcontenido.SetActiveView(vBienvenida);
            ucontenido.Update();
        }

        protected void Menu_producto_Click(object sender, EventArgs e)
        {
            mcontenido.SetActiveView(vProducto);
            ucontenido.Update();
        }

        protected void Menu_departamento_Click(object sender, EventArgs e)
        {
            mcontenido.SetActiveView(vDepartamento);
            ucontenido.Update();
        }

        protected void Menu_cliente_Click(object sender, EventArgs e)
        {
            mcontenido.SetActiveView(vCliente);
            ucontenido.Update();
        }

        protected void Menu_usuario_Click(object sender, EventArgs e)
        {
            mcontenido.SetActiveView(vUsuario);
            ucontenido.Update();
        }

        protected void Menu_venta_Click(object sender, EventArgs e)
        {
            mcontenido.SetActiveView(vVenta);
            ucontenido.Update();
        }

        protected void Menu_reporte_Click(object sender, EventArgs e)
        {
            mcontenido.SetActiveView(vReporte);
            ucontenido.Update();
        }

        protected void login_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "exampleModal", "$('#exampleModal').modal('show');", true);
            umodal.Update();
        }

        public void LimpiarMenu()
        {
            Menu_producto.Visible = false;
            Menu_departamento.Visible = false;
            Menu_cliente.Visible = false;
            Menu_reporte.Visible = false;
            Menu_usuario.Visible = false;
            Menu_venta.Visible = false;
            Menu_proveedor.Visible = false;
            login.Visible = true;
            cerrar.Visible = false;
        } 

        public void activaMenu(int idRol)
        {
            UserService service = new UserService();
            List<LinkButton> listaMenuApp = new List<LinkButton>();
            listaMenuApp.Add(Menu_producto);
            listaMenuApp.Add(Menu_departamento);
            listaMenuApp.Add(Menu_cliente);
            listaMenuApp.Add(Menu_venta);
            listaMenuApp.Add(Menu_reporte);
            listaMenuApp.Add(Menu_usuario);
            listaMenuApp.Add(Menu_proveedor);
            service.MenuRoles(idRol, listaMenuApp);
            login.Visible = false;
            cerrar.Visible = true;
        }

        protected void cerrar_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            LimpiarMenu();
            HttpContext.Current.Response.Redirect("Index.aspx", true);
        }

        protected void bvalidarUsuario_Click(object sender, EventArgs e)
        {
            UserService service = new UserService();
            int[] resp = service.validarUsuario(tusuario.Text, tclave.Text);
            if (resp[0]==0)
            {
                ms_validarUsuario.Text = "Usuario o clave son incorrectos";
            }
            else
            {
                if (resp[1]==0)
                {
                    ms_validarUsuario.Text = "Usuasrio bloqueado";
                }
                else
                {
                    //Inicia sesion
                    Session["nombre_rol"] = tusuario.Text;
                    Session["id_roles"] = resp[2];
                    Session["id_usuario"] = resp[3];
                    Session.Timeout = 5;
                    activaMenu(resp[2]);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "exampleModal", "$('#exampleModal').modal('hide');", true);
                    mcontenido.SetActiveView(vBienvenida);
                    umodal.Update();
                    ucontenido.Update();
                    ubarra.Update();

                }
            }
        }

        protected void Menu_proveedor_Click(object sender, EventArgs e)
        {
            mcontenido.SetActiveView(vProveedor);
            ucontenido.Update();
        }
    }
}