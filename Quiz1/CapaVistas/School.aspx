<%@ Page Title="" Language="C#" MasterPageFile="~/CapaVistas/Plantilla.Master" AutoEventWireup="true" CodeBehind="School.aspx.cs" Inherits="Quiz1.CapaVistas.School" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>SCHOOL CATALOG</h1>
    <br />
    <div>
        <asp:GridView ID="GridViewEscuela" runat="server"></asp:GridView>
    </div>
    <br />
    <br />
    <div>
        <asp:Label ID="LabelCodigo" runat="server" Text="Codigo"></asp:Label>
        <asp:TextBox ID="txtCodigoEscuela" runat="server"></asp:TextBox>
        <asp:Label ID="LabelNombre" runat="server" Text="Nombre"></asp:Label>
        <asp:TextBox ID="txtNombreEscuela" runat="server"></asp:TextBox>
    </div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>
    <div>
        <asp:Button ID="btnConsultarEscuela" runat="server" Text="Consultar" OnClick="btnConsultarEscuela_Click" />
        <asp:Button ID="btnAgregarEscuela" runat="server" Text="Agregar" OnClick="btnAgregarEscuela_Click" />
    </div>
</asp:Content>
