<%@ Page Title="Consultas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="SistemaEscuela.Admin.Consultas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        label
        {
            display:inline;            
        }
        input[type="radio"]
        {
            width: 50px;
        }
    </style>

    <link  rel="stylesheet" href="../Content/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui-1.8.20.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $("#MainContent_txtFechaInicio").datepicker();
            $("#MainContent_txtFechaFin").datepicker();
            
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>                
            </hgroup>
            <p>
                
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2>Consultar Matriculas</h2>
    <table border="1" width="100%">
        <tr>
            <th>Buscar por:</th>
            <th></th>
            <th></th>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="1">Tipo de Programa</asp:ListItem>
                    <asp:ListItem Value="2">Idioma</asp:ListItem>
                    <asp:ListItem Value="3">Organización</asp:ListItem>
                    <asp:ListItem Value="7">Asesor</asp:ListItem>
                    <asp:ListItem Value="8">Supervisor</asp:ListItem>
                    <asp:ListItem Value="9">Subgerente</asp:ListItem>
                    <asp:ListItem Value="10">Gerente</asp:ListItem>
                    <asp:ListItem Value="4">Estrategia</asp:ListItem>
                    <asp:ListItem Value="5">Estatus</asp:ListItem>
                    <asp:ListItem Value="6">RFC</asp:ListItem>
                </asp:RadioButtonList> 
            </td>
            <td>
                <asp:Panel ID="pnlPrograma" runat="server" Visible="false">
                    <h3>Seleccione Programa</h3>
                    <asp:DropDownList runat="server" ID="ddlPrograma">
                        <asp:ListItem>Mes</asp:ListItem>
                        <asp:ListItem>Individual</asp:ListItem>
                        <asp:ListItem>Dual</asp:ListItem>
                        <asp:ListItem>Trio</asp:ListItem>
                    </asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlIdioma" runat="server" Visible="false">
                    <h3>Seleccione idioma</h3>
                    <asp:EntityDataSource ID="entityIdiomas" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="idiomas" Select="it.[idIdiomas], it.[Nombre]"></asp:EntityDataSource>
                    <asp:DropDownList ID="ddlIdiomas" runat="server" DataSourceID="entityIdiomas" DataTextField="Nombre" DataValueField="idIdiomas"></asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlOrganizacion" runat="server" Visible="false">
                    <h3>Seleccione Organización</h3>
                </asp:Panel>

                <asp:Panel ID="pnlEstrategia" runat="server" Visible="false">
                    <h3>Seleccione Estrategia</h3>
                </asp:Panel>

                <asp:Panel ID="pnlStatus" runat="server" Visible="false">
                    <h3>Seleccione Estatus</h3>
                </asp:Panel>

                <asp:Panel ID="pnlRfc" runat="server" Visible="false">
                    <h3>RFC:</h3>
                    <asp:TextBox ID="txtRfc" runat="server" />
                </asp:Panel>
                <asp:Panel ID="pnlAsesores" runat="server" Visible="false">

                </asp:Panel>
                <asp:Panel ID="pnlSupervisores" runat="server" Visible="false">

                </asp:Panel>
                <asp:Panel ID="pnlSubGerentes" runat="server" Visible="false">

                </asp:Panel>
                <asp:Panel ID="pnlGerente" runat="server" Visible="false">

                </asp:Panel>
            </td>
            <td>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                Fecha inicio:
                <input type="text" runat="server" id="txtFechaInicio" />
                <br />
                Fecha fin:
                <input type="text" runat="server" id="txtFechaFin" />
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnSearch" runat="server" Text="Consultar"/>
            </td>
        </tr>
    </table>
</asp:Content>
