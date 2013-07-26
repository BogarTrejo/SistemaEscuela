<%@ Page Title="Efectuar Pagos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="agregarPago.aspx.cs" Inherits="SistemaEscuela.Finanzas.agregarPago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link  rel="stylesheet" href="../Content/themes/base/jquery-ui.css" />    
    <script type="text/javascript" src="../Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui-1.8.20.min.js"></script>
    
    <script type="text/javascript">

        $(document).ready(function () {


            $("#txtFecha").datepicker();

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
    <h2>Pagos</h2>
    <table cellspacing="0" cellpadding="4" id="MainContent_gridPagos" style="color:#333333;border-collapse:collapse;">
        <tr style="color:White;background-color:#5D7B9D;font-weight:bold;">
            <th scope="col">Fecha Reporte</th>
            <th scope="col">Precio Básico</th>
            <th scope="col">Cuota Inicial</th>
            <th scope="col">Saldo</th>
            <th scope="col">Vencimiento</th>
            <th scope="col">No. Cuotas</th>
            <th scope="col">Cuota Mensual</th>
            <th scope="col">No. Contrato</th>
            <th scope="col">Elaboro</th>
            <th scope="col">RP</th>
        </tr>
        <tr style="color:#333333;background-color:#F7F6F3;">
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
    <asp:GridView ID="gridPagos" runat="server" AutoGenerateColumns="False" DataSourceID="entityPagos" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Fecha_de_Pago" HeaderText="Fecha de Pago" ReadOnly="True" SortExpression="Fecha_de_Pago" />
            <asp:BoundField DataField="Cantidad_Recibida" HeaderText="Cantidad Recibida" ReadOnly="True" SortExpression="Cantidad_Recibida" />
            <asp:BoundField DataField="Mes_Pagado" HeaderText="Mes Pagado" ReadOnly="True" SortExpression="Mes_Pagado" />
            <asp:BoundField DataField="Numero_Cuota" HeaderText="Número Cuota" ReadOnly="True" SortExpression="Numero_Cuota" />
            <asp:BoundField DataField="Metodo_Pago" HeaderText="Método Pago" ReadOnly="True" SortExpression="Metodo_Pago" />
            <asp:BoundField DataField="Elaboro" HeaderText="Elaboró" ReadOnly="True" SortExpression="Elaboro" />
            <asp:BoundField DataField="Tipo_Pago" HeaderText="Tipo Pago" ReadOnly="True" SortExpression="Tipo_Pago" />
            <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" ReadOnly="True" SortExpression="Observaciones" />
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
                <%--<asp:Calendar ID="calendarFecha" runat="server"></asp:Calendar>--%>
                <asp:TextBox ID="txtFecha" runat="server" ClientIDMode="Static"/>
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
            <th>Recibido:</th>
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
