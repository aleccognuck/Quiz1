<%@ Page Title="Bienvenidos a Programación II" Language="C#" MasterPageFile="~/CapaVistas/Plantilla.Master" AutoEventWireup="true" CodeBehind="HOME.aspx.cs" Inherits="Quiz1.CapaVistas.HOME" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="cssHome/HOMECSS.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header>
        <h1>Bienvenidos a Programación II</h1>
    </header>

    <div class="container">
        <div class="welcome-section">
            <h2>¡Bienvenidos a la Escuela Programación II!</h2>
            <p>En nuestra escuela, nos dedicamos a ofrecer una formación de calidad en el ámbito de la programación y la tecnología. Nuestro enfoque está orientado a preparar a los estudiantes para enfrentar los desafíos del mundo digital con creatividad y habilidades técnicas.</p>
            <a href="#contacto" class="cta-button">Contáctanos</a>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 Programación II | Todos los derechos reservados</p>
    </div>
</asp:Content>
