<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="SistemaEscuela.Registro.Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            height: 66px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
 

    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

       <h1>Registro<%--<asp:EntityDataSource ID="EntityMatricula" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EnableInsert="True" EntitySetName="matricula">
        </asp:EntityDataSource>--%>
    </h1>

    <h2>Con titular existente:</h2>
    <div>
        <table>
            <tr>
                <th>Buscar:</th>
                <td><asp:TextBox ID="txtBuscarTitular" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="divHelper" runat="server"></div>
                </td>
                
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblResultadoBusqueda" runat="server" Text="No se encontró el Titular" Visible="false" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBuscarTitular" runat="server" Text="Buscar" OnClick="btnBuscarTitular_Click"/>
                </td>
                <td>
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                </td>
            </tr>
        </table>
    </div>

    <table>
        <tr>
            <th>Vigencia:</th>
            <td>
                <asp:TextBox ID="txtVigencia" runat="server" />
            </td>
        </tr>
        <tr>
            <th>No. consecutivo:</th>
            <td>
                <asp:TextBox ID="txtNoConsec" runat="server" />
            </td>
        </tr>
        <tr>
            <th>No. Puntos:</th>
            <td>
                <asp:TextBox ID="txtNoPuntos" runat="server" />
            </td>
        </tr>
        <tr>
            <th>No. Contrato:</th>
            <td>
                <asp:TextBox ID="txtNoContrato" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Fecha:</th>
            <td>
                <asp:Calendar ID="cldFecha" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <th>No. RP:</th>
            <td>
                <asp:TextBox ID="txtNoRp" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Nombre del Titular:</th>
            <td>
                <asp:TextBox ID="txtNombreTitular" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Email del titular:</th>
            <td>
                <asp:TextBox ID="txtEmailTitular" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Nombre del beneficiario:</th>
            <td>
                <asp:TextBox ID="txtNombreEstudiante" runat="server" />
            </td>
        </tr>
        <tr>
            <th>RFC del Titular:</th>
            <td>
                <asp:TextBox ID="txtRfc" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Nombre de la organización:</th>
            <td>
                <%--<asp:EntityDataSource ID="EntityOrg" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="organizacion" Select="it.[idOrganizacion], it.[Nombre], it.[Gerente]"></asp:EntityDataSource>--%>
                <asp:EntityDataSource ID="EntityOrg" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="organizacions" Select="it.[idOrganizacion], it.[Nombre], it.[Gerente]"></asp:EntityDataSource>
                <asp:DropDownList ID="ddlOrganizacion" runat="server" DataSourceID="EntityOrg" DataTextField="Nombre" DataValueField="idOrganizacion" AutoPostBack="True" ></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>Subgerente:</th>
            <td>
                <asp:DropDownList ID="ddlSubGerente" runat="server" DataSourceID="EntitySubGerente" DataTextField="Nombre" DataValueField="idSubgerente"></asp:DropDownList>
                <asp:EntityDataSource ID="EntitySubGerente" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="subgerentes" EntityTypeFilter="" Select="it.[idSubgerente], it.[Nombre], it.[Organizacion_idOrganizacion]" Where="">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="ddlOrganizacion" Name="Organizacion_idOrganizacion" PropertyName="SelectedValue" Type="Int32" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </td>
        </tr>
        <tr>
            <th>Supervisor:</th>
            <td>
                <asp:DropDownList ID="ddlSupervisor" runat="server" DataSourceID="EntitySupervisor" DataTextField="Nombre" DataValueField="idSupervisor" />
                <asp:EntityDataSource ID="EntitySupervisor" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="supervisors" Select="it.[idSupervisor], it.[Nombre], it.[Organizacion_idOrganizacion]" AutoGenerateWhereClause="True" EntityTypeFilter="" Where="">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="ddlOrganizacion" Name="Organizacion_idOrganizacion" PropertyName="SelectedValue" Type="Int32" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </td>
        </tr>
        <tr>
            <th>Asesor:</th>
            <td>
                <asp:DropDownList ID="ddlAsesor" runat="server" DataSourceID="EntityAsesor" DataTextField="Nombre" DataValueField="idAsesor" />

                <asp:EntityDataSource ID="EntityAsesor" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="asesors" Select="it.[idAsesor], it.[Nombre], it.[Organizacion_idOrganizacion]" AutoGenerateWhereClause="True" EntityTypeFilter="" Where="">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="ddlOrganizacion" Name="Organizacion_idOrganizacion" PropertyName="SelectedValue" Type="Int32" />
                    </WhereParameters>
                </asp:EntityDataSource>

            </td>
        </tr>
        <tr>
            <th class="auto-style1">Idioma: </th>
            <td class="auto-style1">
                <asp:EntityDataSource ID="EntityIdioma" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableFlattening="False" EntitySetName="idiomas" Select="it.[idIdiomas], it.[Nombre] +' - ' + it.[Nivel] as Value"></asp:EntityDataSource>
                <asp:DropDownList ID="ddlIdioma" runat="server" DataSourceID="EntityIdioma" DataTextField="Value" DataValueField="idIdiomas"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>Idioma Opcional: </th>
            <td>                
                <asp:DropDownList ID="ddlIdiomaOpcional" runat="server" DataSourceID="EntityIdioma" DataTextField="Value" DataValueField="idIdiomas"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>Tipo de programa:</th>
            <td>
                <asp:DropDownList ID="ddlTipoPrograma" runat="server" >
                    <asp:ListItem>Mes</asp:ListItem>
                    <asp:ListItem>Individual</asp:ListItem>
                    <asp:ListItem>Dual</asp:ListItem>
                    <asp:ListItem>Trio</asp:ListItem>

                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>Tiempo de Servicio:</th>
            <td>
                <asp:TextBox ID="txtTiempoServicio" runat="server" />
            </td>
        </tr>
<%--        <tr>
            <th>Pago de Inscripción:</th>
            <td>
                <asp:TextBox ID="txtPagoInscripcion" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Fecha de Pago:</th>
            <td>
                <asp:Calendar ID="cldFechaPago" runat="server"></asp:Calendar>
            </td>
        </tr>--%>
        <tr>
            <th>
                Cuotas:
            </th>
            <td>
                <asp:TextBox ID="txtCuotas" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Importe mensual:</th>
            <td>
                <asp:TextBox ID="txtImporteMensual" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Costo Total:</th>
            <td>
                <asp:TextBox ID="txtCostoTotal" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Pago de Inscripción</th>
            <td>
                <asp:DropDownList ID="ddlTipoPago" runat="server">
                    <asp:ListItem>Efectivo</asp:ListItem>
                    <asp:ListItem>Cheque</asp:ListItem>
                    <asp:ListItem>Tarjeta</asp:ListItem>

                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>Estatus de Matricula:</th>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem>OK</asp:ListItem>
                    <asp:ListItem>Pendiente</asp:ListItem>
                    <asp:ListItem>Opcional</asp:ListItem>
                    <asp:ListItem>Cancelado</asp:ListItem>

                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>Observaciones (si aplica)</th>
            <td>
                <asp:TextBox ID="txtObservacionesStatus" runat="server" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <th>Estrategia:</th>
            <td>
                <asp:TextBox ID="txtEstrategia" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Teléfono particular:</th>
            <td>
                <asp:TextBox ID="txtTelefonoPart" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Teléfono Celular:</th>
            <td>
                <asp:TextBox ID="txtTelefonoCel" runat="server" />
            </td>
        </tr>
<%--        <tr>
            <th colspan="2" style="text-align:center">Dirección</th>
        </tr>--%>
        <tr>
            <th>Calle:</th>
            <td>
                <asp:TextBox ID="txtCalle" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Colonia:</th>
            <td>
                <asp:TextBox ID="txtColonia" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Número:</th>
            <td>
                <asp:TextBox ID="txtNumCasa" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Empresa donde labora:</th>
            <td>
                <asp:TextBox ID="txtEmpresaLabora" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Teléfono Oficina:</th>
            <td>
                <asp:TextBox ID="txtTelOfi" runat="server" />
            </td>
        </tr>
        <tr>
            <th>Cargo/Profesión:</th>
            <td>
                <asp:TextBox ID="txtCargo" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Registrar" />
            </td>
        </tr>
    </table>

</asp:Content>
