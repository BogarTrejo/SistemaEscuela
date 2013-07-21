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
    <a href="agregarPago.aspx" runat="server" id="agregarPagoUrl"> Efectuar pago </a>
    <h2>Alumnos registrados de <%: Request.QueryString["nombre"] %></h2>
    <br />
    <table>
        <tr>
            <th> </th>
            <th>Nombre</th> 
            <th>Matricula</th>  
            <th>Idiomas</th>       
        </tr>
        <asp:Repeater ID="listadoAlumno" runat="server">
            <ItemTemplate>
            <tr>
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
                    Aqui deben de ir los idiomas
                </td>
            </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <h2>Idioma(s)</h2>
        <ul>
            <asp:Repeater ID="idiomasRepeater" runat="server">
                <ItemTemplate>
                    <li><%# Eval("Nombre") %></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    <br />
    <h2> Verificar datos </h2>
    <br />
    <h3> Datos Titular </h3>
    <asp:EntityDataSource ID="entityTitular" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="titulars" Where="" EnableUpdate="True">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" Name="idTitular" QueryStringField="id" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="gridTitular" runat="server" AutoGenerateColumns="False" DataSourceID="entityTitular" DataKeyNames="idTitular">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono_Particular" SortExpression="Telefono_Particular">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Telefono_Particular") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono_Oficina" SortExpression="Telefono_Oficina">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Telefono_Oficina") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RFC" SortExpression="RFC">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("RFC") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Compania" SortExpression="Compania">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Compania") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Profesion" SortExpression="Profesion">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Profesion") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono_Celular" SortExpression="Telefono_Celular">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Telefono_Celular") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No_Confidencial" SortExpression="No_Confidencial">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("No_Confidencial") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("No_Confidencial") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <h3>Dirección</h3>
    <asp:GridView ID="gridDir" runat="server" />
    <br />
    <h3> Datos Matricula </h3>
    <asp:EntityDataSource ID="entityMatriculas" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="matriculas" Select="it.[Numero_Contrato], it.[Estatus], it.[Costo_Total], it.[Cuota], it.[Importe_Mensual], it.[Fecha_Matricula], it.[Fecha_Validacion], it.[No_Puntos], it.[No_RP], it.[Tiempo_Servicio], it.[Tipo_Programa], it.[Estrategia], it.[Saldo_Pendiente], it.[Vigencia], it.[No_Consecutivo]" Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" Name="Titular_idTitular" QueryStringField="id" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="gridMatriculas" runat="server" AutoGenerateColumns="False" DataSourceID="entityMatriculas">
        <Columns>
            <asp:BoundField DataField="Numero_Contrato" HeaderText="Numero_Contrato" ReadOnly="True" SortExpression="Numero_Contrato" />
            <asp:BoundField DataField="Estatus" HeaderText="Estatus" ReadOnly="True" SortExpression="Estatus" />
            <asp:BoundField DataField="Costo_Total" HeaderText="Costo_Total" ReadOnly="True" SortExpression="Costo_Total" />
            <asp:BoundField DataField="Cuota" HeaderText="Cuota" ReadOnly="True" SortExpression="Cuota" />
            <asp:BoundField DataField="Importe_Mensual" HeaderText="Importe_Mensual" ReadOnly="True" SortExpression="Importe_Mensual" />
            <asp:BoundField DataField="Fecha_Matricula" HeaderText="Fecha_Matricula" ReadOnly="True" SortExpression="Fecha_Matricula" />
            <asp:BoundField DataField="Fecha_Validacion" HeaderText="Fecha_Validacion" ReadOnly="True" SortExpression="Fecha_Validacion" />
            <asp:BoundField DataField="No_Puntos" HeaderText="No_Puntos" ReadOnly="True" SortExpression="No_Puntos" />
            <asp:BoundField DataField="No_RP" HeaderText="No_RP" ReadOnly="True" SortExpression="No_RP" />
            <asp:BoundField DataField="Tiempo_Servicio" HeaderText="Tiempo_Servicio" ReadOnly="True" SortExpression="Tiempo_Servicio" />
            <asp:BoundField DataField="Tipo_Programa" HeaderText="Tipo_Programa" ReadOnly="True" SortExpression="Tipo_Programa" />
            <asp:BoundField DataField="Estrategia" HeaderText="Estrategia" ReadOnly="True" SortExpression="Estrategia" />
            <asp:BoundField DataField="Saldo_Pendiente" HeaderText="Saldo_Pendiente" ReadOnly="True" SortExpression="Saldo_Pendiente" />
            <asp:BoundField DataField="Vigencia" HeaderText="Vigencia" ReadOnly="True" SortExpression="Vigencia" />
            <asp:BoundField DataField="No_Consecutivo" HeaderText="No_Consecutivo" ReadOnly="True" SortExpression="No_Consecutivo" />
        </Columns>
    </asp:GridView>


</asp:Content>
