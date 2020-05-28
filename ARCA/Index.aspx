<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ARCA.Index" %>

<%@ Register Src="~/View/Components/component_producto.ascx" TagPrefix="uc1" TagName="component_producto" %>
<%@ Register Src="~/View/Components/component_departamento.ascx" TagPrefix="uc1" TagName="component_departamento" %>
<%@ Register Src="~/View/Components/component_cliente.ascx" TagPrefix="uc1" TagName="component_cliente" %>
<%@ Register Src="~/View/Components/component_reporte.ascx" TagPrefix="uc1" TagName="component_reporte" %>
<%@ Register Src="~/View/Components/component_usuario.ascx" TagPrefix="uc1" TagName="component_usuario" %>
<%@ Register Src="~/View/Components/component_venta.ascx" TagPrefix="uc1" TagName="component_venta" %>
<%@ Register Src="~/View/Components/component_bienvenida.ascx" TagPrefix="uc1" TagName="component_bienvenida" %>
<%@ Register Src="~/View/Components/component_proveedor.ascx" TagPrefix="uc1" TagName="component_proveedor" %>









<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>EL ARCA</title>
     <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-T5jhQKMh96HMkXwqVMSjF3CmLcL1nT9//tCqu9By5XSdj7CwR0r+F3LTzUdfkkQf" crossorigin="anonymous"/>
   <%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css"/>  
</head>
<body>
    <form id="form1" runat="server"  method="post">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="ubarra" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
             <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                 <asp:LinkButton runat="server" OnClick="Menu_inicio_Click" ID="Menu_inicio" CssClass="navbar-brand active">Inicio</asp:LinkButton>
                 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                 </button>
                 <div class="collapse navbar-collapse" id="navbarColor01">
                     <ul class="navbar-nav mr-auto">
                         <li class="nav-item">
                             <asp:LinkButton runat="server" ID="Menu_producto" Visible="false" CssClass="nav-link" OnClick="Menu_producto_Click"><i style="margin:5px" class="fas fa-boxes"></i>Productos</asp:LinkButton>
                         </li>
                          <li class="nav-item">
                                <asp:LinkButton runat="server" ID="Menu_departamento" Visible="false" CssClass="nav-link" OnClick="Menu_departamento_Click"><i style="margin:5px" class="far fa-clipboard"></i>Departamentos</asp:LinkButton>
                            
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton runat="server" ID="Menu_cliente" Visible="false" CssClass="nav-link" OnClick="Menu_cliente_Click"><i style="margin:5px" class="fas fa-briefcase"></i>Clientes</asp:LinkButton>
                                
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton runat="server" ID="Menu_usuario" Visible="false" OnClick="Menu_usuario_Click" CssClass="nav-link"><i style="margin:5px" class="far fa-address-card"></i>Usuarios</asp:LinkButton>
                          
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton runat="server" Visible="false" ID="Menu_venta" OnClick="Menu_venta_Click" CssClass="nav-link"><i style="margin:5px" class="fas fa-cart-arrow-down"></i>Caja</asp:LinkButton>
                            
                            </li>
                         <li class="nav-item">
                             <asp:LinkButton runat="server" Visible="false" ID="Menu_proveedor" OnClick="Menu_proveedor_Click" CssClass="nav-link"><i style="margin:5px" class="fas fa-user-tie"></i>Proveedores</asp:LinkButton>
                         </li>
                            <li class="nav-item">
                                <asp:LinkButton runat="server" Visible="false" OnClick="Menu_reporte_Click" ID="Menu_reporte" CssClass="nav-link"><i style="margin:5px" class="fas fa-chart-line"></i>Reportes</asp:LinkButton>                         
                            </li>
                     </ul>
                     <div class="form-inline my-2 my-lg-0">
                     <h4><span style="margin: 10px" class="badge badge-pill badge-secondary"></span></h4>
                                      <asp:LinkButton OnClick="login_Click" runat="server" ID="login" CssClass="btn btn-success my-2 my-sm-0">Ingresar<i style="margin:5px" class="far fa-user"></i></asp:LinkButton>
                           <asp:LinkButton OnClick="cerrar_Click" Visible="false" runat="server" ID="cerrar" CssClass="btn btn-danger my-2 my-sm-0">Cerrar sesión<i style="margin:5px" class="fas fa-sign-out-alt"></i></asp:LinkButton>
                 </div>
             </nav>
            </ContentTemplate>
        </asp:UpdatePanel>
       <asp:UpdatePanel runat="server" ID="ucontenido" UpdateMode="Conditional" ChildrenAsTriggers="true">
           <ContentTemplate>
               <div>
                   <asp:MultiView runat="server" ID="mcontenido">
                       <asp:View runat="server" ID="vProducto">
                           <h3>Productos</h3>
                           <uc1:component_producto runat="server" id="component_producto" />
                       </asp:View>
                       <asp:View runat="server" ID="vDepartamento">
                        
                           <uc1:component_departamento runat="server" id="component_departamento" />
                       </asp:View>
                       <asp:View runat="server" ID="vCliente">
                           <h3>Clientes</h3>
                           <uc1:component_cliente runat="server" id="component_cliente" />
                       </asp:View>
                       <asp:View runat="server" ID="vReporte">
                           <h3>Reportes</h3>
                           <uc1:component_reporte runat="server" id="component_reporte" />
                       </asp:View>
                       <asp:View runat="server" ID="vUsuario">
                           <h3>Usuarios</h3>
                           <uc1:component_usuario runat="server" id="component_usuario" />
                       </asp:View>
                       <asp:View  runat="server" ID="vProveedor">
                           <h3>Proveedores</h3>
                           <uc1:component_proveedor runat="server" id="component_proveedor" />     
                       </asp:View>

                       <asp:View runat="server" ID="vVenta">
                           <h3>Ventas</h3>
                           <uc1:component_venta runat="server" id="component_venta" />
                       </asp:View>
                       <asp:View runat="server" ID="vBienvenida">
                           
                           <uc1:component_bienvenida runat="server" id="component_bienvenida" />
                       </asp:View>
                   </asp:MultiView>
               </div>
           </ContentTemplate>
       </asp:UpdatePanel>
        <!-- Modal-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
        
        <asp:UpdatePanel runat="server" ID="umodal" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Inicio de sesión</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                     </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="tusuario">Usuario:</label>
                            <asp:TextBox runat="server" ID="tusuario" placeholder="Ingrese nombre de usuario" CssClass="form-control"></asp:TextBox>
                       <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="tusuario"
                           ForeColor="Red" ErrorMessage="Ingrese nombre de usuario" ValidationGroup="g1"></asp:RequiredFieldValidator>
                         
                        </div>
                        <div class="form-group">
                            <label for="tclave">Contraseña</label>
                            <asp:TextBox runat="server" ID="tclave" TextMode="Password" placeholder="Ingrese clave" CssClass="form-control"></asp:TextBox>
                       <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="tclave"
                           ForeColor="Red" ErrorMessage="Clave obligatoria" ValidationGroup="g1"></asp:RequiredFieldValidator>
                            </div>
                        <br />
                        <asp:Label runat="server" ID="ms_validarUsuario" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <asp:Button runat="server" Text="Ingresar" ID="bvalidarUsuario" OnClick="bvalidarUsuario_Click" CssClass="btn btn-primary" />
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
    </form>












    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
