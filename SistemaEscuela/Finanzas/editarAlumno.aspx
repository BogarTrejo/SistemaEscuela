<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editarAlumno.aspx.cs" Inherits="SistemaEscuela.Finanzas.editarAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {            
            $("#DropDownList1").change(function () {
                $("#hiddenField").val($(this).val());
            });

        });
    </script>
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_alumno" DataSourceID="EntityMatricula" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Matricula" HeaderText="Matricula" SortExpression="Matricula" />
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
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="idMatricula" DataSourceID="entitySTatus" Height="50px" Width="125px" CellPadding="4" ForeColor="#333333" GridLines="None" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Estatus" SortExpression="Estatus">
                <EditItemTemplate>
                    <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Estatus") %>'></asp:TextBox>--%>   
                    <asp:HiddenField ID="hiddenField" runat="server" ClientIDMode="Static" Value='<%# Bind("Estatus") %>' />                 
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="211px" ClientIDMode="Static">
                        <asp:ListItem>OK</asp:ListItem>
                        <asp:ListItem>Pendiente</asp:ListItem>
                        <asp:ListItem>Opcional</asp:ListItem>
                        <asp:ListItem>Cancelado</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estatus") %>'></asp:Label>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>

        

    
</asp:Content>
