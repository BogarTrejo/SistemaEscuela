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
                <asp:GridView ID="gridAlumnos" runat="server" AutoGenerateColumns="False" DataSourceID="entityBuscar" CellPadding="4" ForeColor="#333333" GridLines="None" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <a href='listadoAlumnos.aspx?id=<%# Eval("idTitular") %>&nombre=<%# Eval("Nombre") %>'> Seleccionar </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="idTitular" HeaderText="Id" ReadOnly="True" SortExpression="idTitular" />
                        <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RFC" HeaderText="RFC" ReadOnly="True" SortExpression="RFC" />
                        <asp:BoundField DataField="Telefono_Celular" HeaderText="Telefono Celular" ReadOnly="True" SortExpression="Telefono_Celular" />
                    </Columns>
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
                </asp:GridView>

            </td>
        </tr>
    </table>
</asp:Content>
