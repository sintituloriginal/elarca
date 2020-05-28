<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="component_usuario.ascx.cs" Inherits="ARCA.View.Components.component_usuario" %>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-T5jhQKMh96HMkXwqVMSjF3CmLcL1nT9//tCqu9By5XSdj7CwR0r+F3LTzUdfkkQf" crossorigin="anonymous"/>
   <%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/>
<style>
    .OcultarCol{
        display:none;
    }
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <h4 class="text-center text-primary">Registro de Usuarios</h4>
            <asp:TextBox runat="server" ID="id_usuario" CssClass="OcultarCol"></asp:TextBox>

            <div class="form-group">
                <label for="nombre_rol">Nombre de usuario</label>
                <div class="input-group mb-2">
                    <asp:TextBox runat="server" ID="tnombre_rol" CssClass="form-control" placeholder="Ingrese usuario"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label for="tclave_user">Contraseña</label>
                <div class="input-group mb-2">
                    <asp:TextBox TextMode="Password" runat="server" ID="tclave_user" CssClass="form-control" placeholder="Ingrese una clave"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label for="trol">Privilegio</label>
            </div>

            <br />
            <asp:Button runat="server" ID="idAgregaruser" Text="Registrar" CssClass="btn btn-success" OnClick="idAgregaruser_Click" />
            <asp:Label runat="server" ID="iduser_original" CssClass="OcultarCol"></asp:Label>
            <asp:Button runat="server" ID="idEditaruser" Text="Actualizar" OnClick="idEditaruser_Click" CssClass="btn btn-primary" />
            <asp:Button runat="server" ID="idEliminaruser" Text="Eliminar" OnClick="idEliminaruser_Click" CssClass="btn btn-danger" /> 
            <br /><br />
            <asp:Panel runat="server" ID="alerta" Visible="false">
                <button type="button" class="close" data-dismiss="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="alert-heading">Mensaje de sistema</h4>
                <asp:Label runat="server" ID="Mensaje"></asp:Label>
            <hr />
                <%=DateTime.Now %>
            </asp:Panel>
        </div>
        <br /><br />

    </div>
</div>