<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaEscuela.Finanzas.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1>Finanzas</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <th>Buscar Titulares:</th>
            <td>
                <asp:TextBox ID="txtBuscarAlumno" runat="server" placeholder="Por Nombre o RFC" />
            </td>   
            <td>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
            </td>         
        </tr>
        <tr>
            <td colspan="3">
                <asp:EntityDataSource ID="entityBuscar" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="titulars" Select="it.[Nombre], it.[idTitular], it.[RFC], it.[Telefono_Celular]" Where="it.[Nombre] like '%'+@Nombre+'%' OR it.[RFC] = @Nombre " EntityTypeFilter="">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="txtBuscarAlumno" DbType="String" Name="Nombre" PropertyName="Text" />
                    </WhereParameters>
                </asp:EntityDataSource>
                <asp:GridView ID="gridAlumnos" runat="server" AutoGenerateColumns="False" DataSourceID="entityBuscar" >
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <a href='listadoAlumnos.aspx?id=<%# Eval("idTitular") %>&nombre=<%# Eval("Nombre") %>'> Seleccionar </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="idTitular" HeaderText="idTitular" ReadOnly="True" SortExpression="idTitular" />
                        <asp:BoundField DataField="RFC" HeaderText="RFC" ReadOnly="True" SortExpression="RFC" />
                        <asp:BoundField DataField="Telefono_Celular" HeaderText="Telefono_Celular" ReadOnly="True" SortExpression="Telefono_Celular" />
                    </Columns>
                </asp:GridView>

            </td>
        </tr>
    </table>
</asp:Content>
