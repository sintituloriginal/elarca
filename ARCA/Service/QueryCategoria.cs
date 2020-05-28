using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ARCA.Models;

namespace ARCA.Service
{
    public class QueryCategoria
    {
        static List<QueryCategoria> queryCategorias = new List<QueryCategoria>();

        public List<object> MostrarCategoria()
        {
            try
            {
                using (db contexto = new db())
                {
                    var dep = from d in contexto.departamento select new { d.iddepartamento, d.nombredepartamento };
                    return dep.ToList<object>();
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool addDepartamento(departamento dep)
        {
            try
            {
                using (db contexto = new db())
                {
                    contexto.departamento.Add(dep);
                    contexto.SaveChanges();
                    int respuestas = contexto.SaveChanges();
                    return respuestas == 1;
                }
            }
            catch (Exception)
            {

                return false;
            }
        } 
        public List<object> BuscarDepartamento(String dato, int filtro)
        {
            using (db contexto = new db())
            {
                switch (filtro)
                {
                    case 0: //Buscar por nombre
                        var dNombre = from d in contexto.departamento
                                      where d.nombredepartamento.ToLower().StartsWith(dato.ToLower())
                                      select new
                                      {
                                          d.iddepartamento,
                                          d.nombredepartamento
                                      };
                        return dNombre.ToList<object>();
                    default:
                        var dTodo = from d in contexto.departamento
                                    select new { d.iddepartamento, d.nombredepartamento };
                        return dTodo.ToList<object>();
                }
            }
        }
        public bool eliminarDepartamento(int id_dep)
        {
            try
            {
                using (db contexto = new db())
                {
                    var user = contexto.departamento.Find(id_dep);
                    contexto.departamento.Remove(user);
                    contexto.SaveChanges();
                    int respuesta = contexto.SaveChanges();
                    return respuesta == 1;
                }
            }
            catch (Exception)
            {

                return false;
            }
        }
        public bool editarDepartamento(departamento departamento, String cod_original)
        {
            try
            {
                int idOriginal = Convert.ToInt32(cod_original);
                using (db contexto = new db())
                {
                    //Buscar departamento en la  bd
                    var user = contexto.departamento.First(dep => dep.iddepartamento == idOriginal);
                    //actualizar los datos
                    user.nombredepartamento = departamento.nombredepartamento;
                    //guardar los cambios
                    int respuesta = contexto.SaveChanges();
                    return respuesta == 1;
                        
                }
            }
            catch (Exception)
            {

                return false;
            }
        }


    }      
}