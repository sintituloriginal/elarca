<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="component_departamento.ascx.cs" Inherits="ARCA.View.Components.component_departamento" %>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-T5jhQKMh96HMkXwqVMSjF3CmLcL1nT9//tCqu9By5XSdj7CwR0r+F3LTzUdfkkQf" crossorigin="anonymous"/>
   <%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/>
<style>
    .OcultarCol {
        display: none;
    }
</style>
<div class="container-fluid">
<div class="row">
    <div class="col-md-4">
        <h4 class="text-center text-primary">Registro de departamento</h4>

            <asp:TextBox runat="server" ID="idcat" CssClass="OcultarCol"></asp:TextBox>

        <div class="form-group">
            <label for="tnombrecategoria">Nombre departamento</label>
            <div class="input-group mb-2">
                <asp:TextBox runat="server" ID="tnombrecat" CssClass="form-control" placeholder="Ingrese nombre"></asp:TextBox>
            </div>
        </div>
        <br />
        <asp:Button runat="server" ID="idAgregarcat" Text="Registrar" CssClass="btn btn-success" OnClick="idAgregarcat_Click" />
     <asp:Label runat="server" ID="idcat_original" CssClass="OcultarCol"></asp:Label>
        <asp:Button runat="server" ID="idEditarcat" Text="Actualizar" OnClick="idEditarcat_Click" CssClass="btn btn-primary" />
    <asp:Button runat="server" ID="idEliminarcat" Text="Eliminar" OnClick="idEliminarcat_Click" CssClass="btn btn-danger" />
     <br /><br />
        <asp:Panel runat="server" ID="alerta" Visible="false">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="alert-heading">Mensaje de sistema</h4>
            <asp:Label runat="server" ID="Mensaje"></asp:Label>
            <hr />
            <%=DateTime.Now %>
        </asp:Panel>
    </div>
    <br /><br />

     

    <div class="col-lg-8">
        <h4 class="text-center text-primary">Buscar departamento</h4>
        <div class="input-group mb-2">
            <asp:TextBox runat="server" ID="tDatoBuscarcat" placeholder="Ingrese un parametro" CssClass="form-control"></asp:TextBox>
            
            <div class="input-group-prepend">
           <asp:DropDownList runat="server" ID="idOpciones" CssClass="form-control">
               <asp:ListItem Value="0" Text="Buscar por nombre"></asp:ListItem>
           <asp:ListItem Value="1" Text="Mostrar todos" Selected="True"></asp:ListItem>
           </asp:DropDownList>       
           <asp:Button runat="server" Text="Buscar" ID="bBuscarCat" OnClick="bBuscarCat_Click" CssClass="btn btn-success" />       
               </div>
            </div>
        <asp:GridView runat="server" ID="idTablacat" CssClass="table table-bordered" AutoGenerateColumns="false"
            OnRowCommand="idTablacat_RowCommand" PageSize="8" OnPageIndexChanging="idTablacat_PageIndexChanging" AllowPaging="true">
            <HeaderStyle CssClass="btn-dark" />
            <Columns>
                <asp:BoundField DataField="iddepartamento" HeaderText="ID" />
                <asp:BoundField DataField="nombredepartamento" HeaderText="Nombre departamento" />
             <asp:ButtonField ButtonType="Link" CommandName="idseleccionarcat" ControlStyle-CssClass="btn btn-primary" text="seleccionar"/>
            </Columns>
        </asp:GridView>
        <br />
      

    </div>
</div>
</div>




<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-Jj