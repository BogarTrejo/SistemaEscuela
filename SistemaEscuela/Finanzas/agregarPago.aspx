<%@ Page Title="Efectuar Pagos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="agregarPago.aspx.cs" Inherits="SistemaEscuela.Finanzas.agregarPago" %>
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
    <h2>Pagos</h2>
    <table>
        <tr>
            <th>Fecha Reporte</th>
            <th>Precio Básico</th>
            <th>Cuota Inicial</th>
            <th>Saldo</th>
            <th>Vencimiento</th>
            <th>No. Cuotas</th>
            <th>Cuota Mensual</th>
            <th>No. Contrato</th>
            <th>Elaboro</th>
            <th>RP</th>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblFecha" />
            </td>
            <td>
                <asp:Label runat="server" ID="lblPrecio" />
            </td>
            <td>
                <asp:Label runat="server" ID="lblCuotaInicial" />
            </td>
            <td>
                <asp:Label runat="server" ID="lblSaldo" />
            </td>
            <td>
                <asp:Label runat="server" ID="lblVencimiento" />
            </td>
            <td>
                <asp:Label runat="server" ID="lblNoCuotas" />
            </td>
            <td>
                <asp:Label runat="server" ID="lblCuotaMensual" />
            </td>
            <td>
                <asp:Label runat="server" ID="lblNoContrato" />
            </td>
            <td>
                <asp:Label runat="server" ID="lblElaboro" />
            </td>
            <td>
                <asp:Label runat="server" ID="lblRp" />
            </td>
        </tr>
    </table>
    <br />
    <h2>Pagos realizados</h2>
    <asp:EntityDataSource ID="entityPagos" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="pagos" Select="it.[Fecha_de_Pago], it.[Cantidad_Recibida], it.[Mes_Pagado], it.[Numero_Cuota], it.[Metodo_Pago], it.[Elaboro], it.[Tipo_Pago], it.[Observaciones]" Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" Name="Titular_idTitular" QueryStringField="id" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="gridPagos" runat="server" AutoGenerateColumns="False" DataSourceID="entityPagos">
        <Columns>
            <asp:BoundField DataField="Fecha_de_Pago" HeaderText="Fecha_de_Pago" ReadOnly="True" SortExpression="Fecha_de_Pago" />
            <asp:BoundField DataField="Cantidad_Recibida" HeaderText="Cantidad_Recibida" ReadOnly="True" SortExpression="Cantidad_Recibida" />
            <asp:BoundField DataField="Mes_Pagado" HeaderText="Mes_Pagado" ReadOnly="True" SortExpression="Mes_Pagado" />
            <asp:BoundField DataField="Numero_Cuota" HeaderText="Numero_Cuota" ReadOnly="True" SortExpression="Numero_Cuota" />
            <asp:BoundField DataField="Metodo_Pago" HeaderText="Metodo_Pago" ReadOnly="True" SortExpression="Metodo_Pago" />
            <asp:BoundField DataField="Elaboro" HeaderText="Elaboro" ReadOnly="True" SortExpression="Elaboro" />
            <asp:BoundField DataField="Tipo_Pago" HeaderText="Tipo_Pago" ReadOnly="True" SortExpression="Tipo_Pago" />
            <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" ReadOnly="True" SortExpression="Observaciones" />
        </Columns>
    </asp:GridView>

    <h1>Realizar pago</h1>
    <table>
        <tr>
            <th>Número de cuota</th>
            <td>
                <asp:TextBox runat="server" ID="txtNoCuota" />
            </td>
        </tr>
        <tr>
            <th>Fecha:</th>
            <td>
                <asp:Calendar ID="calendarFecha" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <th>Mes Pagado:</th>
            <td>
                <asp:DropDownList runat="server" ID="ddlMesPagado">
                    <asp:ListItem Value="Enero" Text="Enero" />
                    <asp:ListItem Value="Febrero" Text="Febrero" />
                    <asp:ListItem Value="Marzo" Text="Marzo" />
                    <asp:ListItem Value="Abril" Text="Abril" />
                    <asp:ListItem Value="Mayo" Text="Mayo" />
                    <asp:ListItem Value="Junio" Text="Junio" />
                    <asp:ListItem Value="Julio" Text="Julio" />
                    <asp:ListItem Value="Agosto" Text="Agosto" />
                    <asp:ListItem Value="Septiembre" Text="Septiembre" />
                    <asp:ListItem Value="Octubre" Text="Octubre" />
                    <asp:ListItem Value="Noviembre" Text="Noviembre" />
                    <asp:ListItem Value="Diciembre" Text="Diciembre" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>Recibido:</th>R
            <td><asp:TextBox ID="txtRecibido" runat="server" /></td>
        </tr>
        <tr>
            <th>No. Recibo</th>
            <td><asp:TextBox ID="txtNoRecibo" runat="server" /></td>
        </tr>
        <tr>
            <th>Interes (si aplica)</th>
            <td> 
                <asp:TextBox ID="txtInteres" runat="server" />

            </td>
        </tr>
        <tr>
            <th>Promoción (si aplica)</th>
            <td><asp:TextBox ID="txtPromo" runat="server" /></td>
        </tr>
        <tr>
            <th>Observación:</th>
            <td><asp:TextBox ID="txtObservacion" runat="server" /></td>
        </tr>
        <tr>            
            <th >No. Factura</th>
            <td><asp:TextBox ID="txtNoFactura" runat="server" /></td>
        </tr>
        <tr>
            <th>Tipo de pago:</th>
            <td>
                <asp:DropDownList ID="ddlTipoPago" runat="server">
                    <asp:ListItem Value="Inscripción" Text="Inscripción" />
                    <asp:ListItem Value="Liquidación" Text="Liquidación" />
                    <asp:ListItem Value="Mensualidad" Text="Mensualidad" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>Método de pago:</th>
            <td>
                <asp:DropDownList ID="ddlMetodoPago" runat="server">
                    <asp:ListItem Value="Efectivo" Text="Efectivo" />
                    <asp:ListItem Value="Crédito" Text="Crédito" />
                    <asp:ListItem Value="Cheque" Text="Cheque" />
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <th>Elaboró:</th>
            <td>
                <asp:TextBox ID="txtElaboro" runat="server" />
            </td>
        </tr>
        <tr>           
            <td colspan="2"><asp:Button ID="btnAgregarPago" runat="server" Text="Agregar pago" OnClick="btnAgregarPago_Click" /></td>
        </tr>

    </table>
</asp:Content>
