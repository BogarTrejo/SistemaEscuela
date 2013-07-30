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
                        <asp:ListItem Value="Mes">Mes</asp:ListItem>
                        <asp:ListItem Value="Individual">Individual</asp:ListItem>
                        <asp:ListItem Value="Dual">Dual</asp:ListItem>
                        <asp:ListItem Value="Trio">Trio</asp:ListItem>
                    </asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlIdioma" runat="server" Visible="false">
                    <h3>Seleccione idioma</h3>
                    <asp:EntityDataSource ID="entityIdiomas" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="idiomas" Select="it.[idIdiomas], it.[Nombre]"></asp:EntityDataSource>
                    <asp:DropDownList ID="ddlIdiomas" runat="server" DataSourceID="entityIdiomas" DataTextField="Nombre" DataValueField="idIdiomas"></asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlOrganizacion" runat="server" Visible="false">
                    <h3>Seleccione Organización</h3>
                    <asp:EntityDataSource ID="entityOrganization" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="organizacions" Select="it.[idOrganizacion], it.[Nombre], it.[Gerente]"></asp:EntityDataSource>
                    <asp:DropDownList ID="ddlOrganizations" runat="server" DataSourceID="entityOrganization" DataTextField="Nombre" DataValueField="idOrganizacion"></asp:DropDownList>
                </asp:Panel>
                <asp:Panel ID="pnlAsesores" runat="server" Visible="false">
                    <h3>Seleccione el Asesor</h3>
                    <asp:DropDownList ID="ddlAsesor" runat="server" DataSourceID="entityAsesor" DataTextField="Nombre" DataValueField="idAsesor"></asp:DropDownList>
                    <asp:EntityDataSource ID="entityAsesor" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="asesors" Select="it.[idAsesor], it.[Nombre]"></asp:EntityDataSource>
                </asp:Panel>
                <asp:Panel ID="pnlSupervisores" runat="server" Visible="false">
                    <h3>Seleccione el Supervisor</h3>
                    <asp:EntityDataSource ID="entitySupervisor" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="supervisors" Select="it.[idSupervisor], it.[Nombre]"></asp:EntityDataSource>
                    <asp:DropDownList ID="ddlSupervisor" runat="server" DataSourceID="entitySupervisor" DataTextField="Nombre" DataValueField="idSupervisor"></asp:DropDownList>
                </asp:Panel>
                <asp:Panel ID="pnlSubGerentes" runat="server" Visible="false">
                    <h3>Seleccione el SubGerente</h3>
                    <asp:EntityDataSource ID="entitySubGerente" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="subgerentes" Select="it.[idSubgerente], it.[Nombre]"></asp:EntityDataSource>
                    <asp:DropDownList ID="ddlSubGerente" runat="server" DataSourceID="entitySubGerente" DataTextField="Nombre" DataValueField="idSubgerente"></asp:DropDownList>
                </asp:Panel>
                <asp:Panel ID="pnlGerente" runat="server" Visible="false">
                    <h3>Seleccione el Gerente</h3>
                    <asp:DropDownList ID="ddlGerente" runat="server" DataSourceID="entityOrganization" DataTextField="Gerente" DataValueField="idOrganizacion"></asp:DropDownList>
                </asp:Panel>
                <asp:Panel ID="pnlEstrategia" runat="server" Visible="false">
                    <h3>Seleccione Estrategia</h3>
                    <asp:EntityDataSource ID="entityEstrategia" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="estrategias" Select="it.[idEstrategia], it.[Estrategia1]"></asp:EntityDataSource>
                    <asp:DropDownList ID="ddlEstrategia" runat="server" DataSourceID="entityEstrategia" DataTextField="Estrategia1" DataValueField="Estrategia1"></asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlStatus" runat="server" Visible="false">
                    <h3>Seleccione Estatus</h3>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem>OK</asp:ListItem>
                        <asp:ListItem>Pendiente</asp:ListItem>
                        <asp:ListItem>Opcional</asp:ListItem>
                        <asp:ListItem>Cancelado</asp:ListItem>

                    </asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlRfc" runat="server" Visible="false">
                    <h3>RFC:</h3>
                    <asp:TextBox ID="txtRfc" runat="server" />
                </asp:Panel>

            </td>
            <td>

            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table width="100%">
                    <tr>
                        <th>Fecha inicio:</th>
                        <td><input type="text" runat="server" id="txtFechaInicio" /></td>
                    </tr>
                    <tr>
                        <th>Fecha fin:</th>
                        <td><input type="text" runat="server" id="txtFechaFin" /></td>
                    </tr>
                </table>                
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnSearch" runat="server" Text="Consultar" OnClick="btnSearch_Click"/>
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        <EmptyDataTemplate>
            <h3>Sin datos que mostrar, trate modificando los filtros</h3>
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>
