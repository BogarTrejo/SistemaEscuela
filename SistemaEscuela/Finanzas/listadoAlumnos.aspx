<%@ Page Title="Verificar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="listadoAlumnos.aspx.cs" Inherits="SistemaEscuela.Finanzas.listadoAlumnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
    <a href="agregarPago.aspx" runat="server" id="agregarPagoUrl"> Efectuar/Consultar pago </a>
    <h2>Alumnos registrados de <%: Request.QueryString["nombre"] %></h2>
    <br />
    <table cellspacing="0" cellpadding="4" id="MainContent_gridPagos" style="color:#333333;border-collapse:collapse;">
        <tr style="color:White;background-color:#5D7B9D;font-weight:bold;">
            <th> </th>
            <th>Nombre</th> 
            <th>Matricula</th>  
            <th>Idiomas</th>       
        </tr>
        <asp:Repeater ID="listadoAlumno" runat="server">
            <ItemTemplate>
            <tr style="color:#333333;background-color:#F7F6F3;">
                <td>
                    <a href="editarAlumno.aspx?id=<%# Eval("id_alumno") %>&matricula=<%# Eval("Matricula_idMatricula") %>"> Editar </a>
                </td>
                <td>
                    <%# Eval("Nombre") %>
                </td>
                <td>
                    <%# Eval("Matricula") %>
                </td>
                <td>
                    <ul>
                        <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem,"idiomas") %>'>
                            <ItemTemplate>
                                <li><%# Eval("Nombre") %></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </td>
            </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <br />
    <h2> Verificar datos </h2>
    <br />
    <h3> Datos Titular </h3>
    <asp:EntityDataSource ID="entityTitular" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="titulars" Where="" EnableUpdate="True">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" Name="idTitular" QueryStringField="id" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="gridTitular" runat="server" AutoGenerateColumns="False" DataSourceID="entityTitular" DataKeyNames="idTitular" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RFC" SortExpression="RFC">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Telefono_Celular") %>'></asp:Label>
                </ItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("RFC") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono Particular" SortExpression="Telefono_Particular">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Telefono_Particular") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono Oficina" SortExpression="Telefono_Oficina">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Telefono_Oficina") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono Celular" SortExpression="Telefono_Celular">
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Compañia" SortExpression="Compania">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Compania") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Profesión" SortExpression="Profesion">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Profesion") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No Confidencial" SortExpression="No_Confidencial">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("No_Confidencial") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("No_Confidencial") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
    <h3>Dirección</h3>
    <asp:GridView ID="gridDir" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" >
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
    </asp:GridView>
    <br />
    <h3> Datos Matricula </h3>
    <asp:EntityDataSource ID="entityMatriculas" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="matriculas" Select="it.[Numero_Contrato], it.[Estatus], it.[Costo_Total], it.[Cuota], it.[Importe_Mensual], it.[Fecha_Matricula], it.[Fecha_Validacion], it.[No_Puntos], it.[No_RP], it.[Tiempo_Servicio], it.[Tipo_Programa], it.[Estrategia], it.[Saldo_Pendiente], it.[Vigencia], it.[No_Consecutivo]" Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" Name="Titular_idTitular" QueryStringField="id" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="gridMatriculas" runat="server" AutoGenerateColumns="False" DataSourceID="entityMatriculas" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Numero_Contrato" HeaderText="Número Contrato" ReadOnly="True" SortExpression="Numero_Contrato" />
            <asp:BoundField DataField="Estatus" HeaderText="Estatus" ReadOnly="True" SortExpression="Estatus" />
            <asp:BoundField DataField="Costo_Total" HeaderText="Costo Total" ReadOnly="True" SortExpression="Costo_Total" />
            <asp:BoundField DataField="Cuota" HeaderText="Cuota" ReadOnly="True" SortExpression="Cuota" />
            <asp:BoundField DataField="Importe_Mensual" HeaderText="Importe Mensual" ReadOnly="True" SortExpression="Importe_Mensual" />
            <asp:BoundField DataField="Fecha_Matricula" HeaderText="Fecha Matricula" ReadOnly="True" SortExpression="Fecha_Matricula" />
            <asp:BoundField DataField="Fecha_Validacion" HeaderText="Fecha Validación" ReadOnly="True" SortExpression="Fecha_Validacion" />
            <asp:BoundField DataField="No_Puntos" HeaderText="No Puntos" ReadOnly="True" SortExpression="No_Puntos" />
            <asp:BoundField DataField="No_RP" HeaderText="No RP" ReadOnly="True" SortExpression="No_RP" />
            <asp:BoundField DataField="Tiempo_Servicio" HeaderText="Tiempo Servicio" ReadOnly="True" SortExpression="Tiempo_Servicio" />
            <asp:BoundField DataField="Tipo_Programa" HeaderText="Tipo Programa" ReadOnly="True" SortExpression="Tipo_Programa" />
            <asp:BoundField DataField="Estrategia" HeaderText="Estrategia" ReadOnly="True" SortExpression="Estrategia" />
            <asp:BoundField DataField="Saldo_Pendiente" HeaderText="Saldo Pendiente" ReadOnly="True" SortExpression="Saldo_Pendiente" />
            <asp:BoundField DataField="Vigencia" HeaderText="Vigencia" ReadOnly="True" SortExpression="Vigencia" />
            <asp:BoundField DataField="No_Consecutivo" HeaderText="No Consecutivo" ReadOnly="True" SortExpression="No_Consecutivo" />
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


</asp:Content>
