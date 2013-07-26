<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaEscuela._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Sistema de SHIT</h2>
            </hgroup>
            <p>
                
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Menú:</h3>
    <ol class="round">
        <li class="one">
            <h5><a href="Registro/Index.aspx">Manejo de alumnos</a></h5>  
            <p>&nbsp;</p>          
        </li>
        <li class="two">
            <h5><a href="Finanzas/Default.aspx"> Manejo de finanzas </a></h5>
            <p>&nbsp;</p>
        </li>
        <li class="three">
            <h5><a href="Admin/Default.aspx"> Administración del Sistema</a></h5>
            <p>&nbsp;</p>
        </li>
    </ol>
</asp:Content>
