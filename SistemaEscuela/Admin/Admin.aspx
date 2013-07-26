<%@ Page Title="Administración" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SistemaEscuela.Admin.Admin" %>
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
    <h2>Idiomas</h2>
    <asp:EntityDataSource ID="entityIdiomas" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="idiomas"></asp:EntityDataSource>
    <asp:DetailsView ID="DetailsView4" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="idIdiomas" DataSourceID="entityIdiomas" ForeColor="#333333" GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:CommandField DeleteText="Eliminar" EditText="Editar" InsertText="Agregar" NewText="Nuevo" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" UpdateText="Actualizar" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EmptyDataTemplate>
            <asp:Button ID="InsertButton" runat="server" CommandName="New"  Text="Nuevo"/>
        </EmptyDataTemplate>
    </asp:DetailsView>
    <h2>Estrategias</h2>
    <asp:EntityDataSource ID="entityEstrategia" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="estrategias"></asp:EntityDataSource>
    <asp:DetailsView ID="DetailsView5" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="idEstrategia" DataSourceID="entityEstrategia" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Estrategia1" HeaderText="Estrategia" SortExpression="Estrategia1" />
            <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" InsertText="Insertar" NewText="Nuevo" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EmptyDataTemplate>
            <asp:Button ID="InsertButton" runat="server" CommandName="New"  Text="Nuevo"/>
        </EmptyDataTemplate>
    </asp:DetailsView>
    <h1>Organizaciones</h1>
    <fieldset>
        <legend>Organizaciones</legend>    
    <asp:EntityDataSource ID="entityOrg" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="organizacions"></asp:EntityDataSource>
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="idOrganizacion" DataSourceID="entityOrg" CellPadding="4" ForeColor="#333333">
        <EmptyDataTemplate>
            <asp:Button ID="InsertButton" runat="server" CommandName="New"  Text="Nuevo"/>
        </EmptyDataTemplate>        
        <EditItemTemplate>
            Id Organización:
            <asp:Label ID="idOrganizacionLabel1" runat="server" Text='<%# Eval("idOrganizacion") %>' />
            <br />
            Nombre:
            <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
            <br />
            Gerente:
            <asp:TextBox ID="GerenteTextBox" runat="server" Text='<%# Bind("Gerente") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Id Organización:
            <asp:TextBox ID="idOrganizacionTextBox" runat="server" Text='<%# Bind("idOrganizacion") %>' />
            <br />
            Nombre:
            <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
            <br />
            Gerente:
            <asp:TextBox ID="GerenteTextBox" runat="server" Text='<%# Bind("Gerente") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Agregar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            Id Organización:
            <asp:Label ID="idOrganizacionLabel" runat="server" Text='<%# Eval("idOrganizacion") %>' />
            <br />
            Nombre:
            <asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' />
            <br />
            Gerente:
            <asp:Label ID="GerenteLabel" runat="server" Text='<%# Bind("Gerente") %>' />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:FormView>
    </fieldset>
    <hr />
    <h1>Asesores</h1>
    <fieldset>
        <legend>Asesores</legend>
    <asp:EntityDataSource ID="entityAsesores" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="asesors"></asp:EntityDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idAsesor" DataSourceID="entityAsesores" CellPadding="4" ForeColor="#333333" GridLines="None">
       
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" InsertText="Agregar" NewText="Nuevo" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="idAsesor" HeaderText="Id Asesor" ReadOnly="True" SortExpression="idAsesor" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Organizacion_idOrganizacion" HeaderText="Id Organización" SortExpression="Organizacion_idOrganizacion" />
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
    <br />
    <h3>Agregar Asesor</h3>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="entityAsesores" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateRows="False" DataKeyNames="idAsesor">
        <EmptyDataTemplate>
            <asp:Button ID="InsertButton" runat="server" CommandName="New"  Text="Nuevo"/>
        </EmptyDataTemplate>        
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Organizacion_idOrganizacion" HeaderText="Id Organización" SortExpression="Organizacion_idOrganizacion" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    </fieldset>
    <hr />
    <br />
    <h1>Subgerentes</h1>
    <fieldset>
        <legend>Subgerentes</legend>   
    <asp:EntityDataSource ID="entitySubgerentes" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="subgerentes"></asp:EntityDataSource>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idSubgerente" DataSourceID="entitySubgerentes" CellPadding="4" ForeColor="#333333" GridLines="None">
     
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" InsertText="Agregar" NewText="Nuevo" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="idSubgerente" HeaderText="Id Subgerente" ReadOnly="True" SortExpression="idSubgerente" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Organizacion_idOrganizacion" HeaderText="Id Organización" SortExpression="Organizacion_idOrganizacion" />
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
    <h3>Agregar Subgerente</h3>
    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="idSubgerente" DataSourceID="entitySubgerentes" CellPadding="4" ForeColor="#333333" GridLines="None">
        <EmptyDataTemplate>
            <asp:Button ID="InsertButton" runat="server" CommandName="New"  Text="Nuevo"/>
        </EmptyDataTemplate>        
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Organizacion_idOrganizacion" HeaderText="Id Organización" SortExpression="Organizacion_idOrganizacion" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    </fieldset>
    <hr />
    <br />
    <h1>Supervisores</h1>
    <fieldset>
        <legend>Supervisores</legend>
    
    <asp:EntityDataSource ID="entitySupervisores" runat="server" ConnectionString="name=multilingualEntities" DefaultContainerName="multilingualEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="supervisors"></asp:EntityDataSource>
    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idSupervisor" DataSourceID="entitySupervisores" CellPadding="4" ForeColor="#333333" GridLines="None">       
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" InsertText="Agregar" NewText="Nuevo" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Organizacion_idOrganizacion" HeaderText="Id Organizacion" SortExpression="Organizacion_idOrganizacion" />
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
        <h3>Agregar supervisores</h3>
        <asp:DetailsView ID="DetailsView3" runat="server" Height="50px" Width="125px" CellPadding="4" DataSourceID="entitySupervisores" ForeColor="#333333" GridLines="None" AutoGenerateRows="False" DataKeyNames="idSupervisor">
            <EmptyDataTemplate>
                <asp:Button ID="InsertButton" runat="server" CommandName="New"  Text="Nuevo"/>
            </EmptyDataTemplate>            
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Organizacion_idOrganizacion" HeaderText="Id Organizacion" SortExpression="Organizacion_idOrganizacion" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </fieldset>
</asp:Content>
