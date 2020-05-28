using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using ARCA.Models;

namespace ARCA.Service
{
    public class UserService
    {
        private db contexto = new db();

        public int[] validarUsuario(String user, string pass)
        {
            int[] respuestas = new int[4];
            try
            {
                var result = from u in contexto.usuario
                             where u.nombre_rol.Trim().ToUpper().Equals(user.Trim().ToUpper())
                             && u.clave_user.Equals(pass)
                             select u;

                respuestas[0] = result.Count() == 1 ? 1 : 0;
                respuestas[1] = result.First().id_estado == 1 ? 1 : 0;
                respuestas[2] = result.First().id_roles;
                respuestas[3] = result.First().id_usuario;
                return respuestas;

            }
            catch (Exception)
            {

                respuestas[0] = 0;
                return respuestas;
            }
        }

        public List<LinkButton> MenuRoles(int idRol, List<LinkButton> listaMenu)
        {
            try
            {
                var result = from asig in contexto.menu_roles
                             join menu in contexto.menu
on asig.id_menu equals menu.id_menu
                             where asig.id_roles == idRol
                             select new { menu.linkmenu };
                foreach (var sis in result.ToList())
                {
                    foreach (var app in listaMenu)
                    {
                        if (sis.linkmenu.Equals(app.ID))
                        {
                            app.Visible = true;
                        }
                    }
                }
                return listaMenu;
            }
            catch (Exception)
            {

                return null;
            }
        }


    }
}