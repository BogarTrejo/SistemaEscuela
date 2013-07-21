<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editarAlumno.aspx.cs" Inherits="SistemaEscuela.Finanzas.editarAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">    
    <h2>Asignar Matricula</h2>
    <asp:EntityDataSource ID="EntityMatricula" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="alumnoes" EntityTypeFilter="" Select="" Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" Name="id_alumno" QueryStringField="id" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_alumno" DataSourceID="EntityMatricula">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Matricula" HeaderText="Matricula" SortExpression="Matricula" />
        </Columns>
    </asp:GridView>

    <table>
        <tr>
            <th>Fecha de verificación:</th>
            <td>
                <asp:TextBox ID="txtFechaVerif" runat="server" />

            </td>
            <td>
                <asp:Button runat="server" ID="btnGuardarVerif" Text="Guardar" OnClick="btnGuardarVerif_Click" />
            </td>
        </tr>
    </table>

    <h2>Estatus de la Matricula</h2>
    <asp:EntityDataSource ID="entitySTatus" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="matriculas" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" Name="idMatricula" QueryStringField="matricula" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="idMatricula" DataSourceID="entitySTatus" Height="50px" Width="125px">
        <Fields>
            <asp:TemplateField HeaderText="Estatus" SortExpression="Estatus">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Estatus") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estatus") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>

        

    
</asp:Content>
