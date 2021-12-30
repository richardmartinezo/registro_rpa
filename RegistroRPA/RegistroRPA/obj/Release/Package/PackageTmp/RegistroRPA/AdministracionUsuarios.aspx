<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AdministracionUsuarios.aspx.cs" Inherits="RegistroRPA.RegistroRPA.AdministracionUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridViewAdministracionUsuario" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUsuarios" KeyFieldName="id" EnableTheming="True" Theme="MetropolisBlue">
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="usuario" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="password" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nombre" VisibleIndex="4"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="apellido" VisibleIndex="5"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="email" VisibleIndex="6"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CC_RUC" VisibleIndex="7"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="direccion" VisibleIndex="8"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="telefono" VisibleIndex="9"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="celular" VisibleIndex="10"></dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="autorizado" VisibleIndex="12"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn FieldName="fecha_solicita" VisibleIndex="13"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="usuario_autoriza" VisibleIndex="14" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="fecha_autoriza" VisibleIndex="15" Visible="False"></dx:GridViewDataDateColumn>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn FieldName="nivel_acceso" VisibleIndex="11">
                <PropertiesComboBox DataSourceID="SqlDataSourceNivelAcceso" TextField="nombre" TextFormatString="{0}; {1}; {2}" ValueField="codigo">
                    <Columns>
                        <dx:ListBoxColumn FieldName="nombre">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="descripcion">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="codigo">
                        </dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>

    <asp:SqlDataSource runat="server" ID="SqlDataSourceUsuarios" ConnectionString='<%$ ConnectionStrings:Registro_RPAConnectionString %>' DeleteCommand="DELETE FROM Tarjeta_RPA WHERE (id = @id)" SelectCommand="SELECT Tarjeta_RPA.* FROM Tarjeta_RPA" UpdateCommand="UPDATE Tarjeta_RPA SET usuario = @usuario, password = @password, nombre = @nombre, apellido = @apellido, email = @email, CC_RUC = @CC_RUC, direccion = @direccion, telefono = @telefono, celular = @celular, nivel_acceso = @nivel_acceso, autorizado = @autorizado, fecha_solicita = @fecha_autoriza, usuario_autoriza = @usuario_autoriza, fecha_autoriza = @fecha_autoriza WHERE (id = @id)" OnUpdating="SqlDataSourceUsuarios_Updating" InsertCommand="INSERT INTO Tarjeta_RPA(usuario, password, nombre, apellido, email, CC_RUC, direccion, telefono, celular, nivel_acceso, autorizado, fecha_solicita, usuario_autoriza, fecha_autoriza) VALUES (@usuario, @password, @nombre, @apellido, @email, @CC_RUC, @direccion, @telefono, @celular, @nivel_acceso, @autorizado, @fecha_solicita, @usuario_autoriza, @fecha_autoriza)" OnInserting="SqlDataSourceUsuarios_Inserting" OnUpdated="SqlDataSourceUsuarios_Updated">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="usuario" />
            <asp:Parameter Name="password" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="apellido" />
            <asp:Parameter Name="email" />
            <asp:Parameter Name="CC_RUC" />
            <asp:Parameter Name="direccion" />
            <asp:Parameter Name="telefono" />
            <asp:Parameter Name="celular" />
            <asp:Parameter Name="nivel_acceso" />
            <asp:Parameter Name="autorizado" />
            <asp:Parameter Name="fecha_solicita" />
            <asp:Parameter Name="usuario_autoriza" />
            <asp:Parameter Name="fecha_autoriza" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="usuario"></asp:Parameter>
            <asp:Parameter Name="password"></asp:Parameter>
            <asp:Parameter Name="nombre"></asp:Parameter>
            <asp:Parameter Name="apellido"></asp:Parameter>
            <asp:Parameter Name="email"></asp:Parameter>
            <asp:Parameter Name="CC_RUC"></asp:Parameter>
            <asp:Parameter Name="direccion"></asp:Parameter>
            <asp:Parameter Name="telefono"></asp:Parameter>
            <asp:Parameter Name="celular"></asp:Parameter>
            <asp:Parameter Name="nivel_acceso"></asp:Parameter>
            <asp:Parameter Name="autorizado"></asp:Parameter>
            <asp:Parameter Name="fecha_autoriza"></asp:Parameter>
            <asp:Parameter Name="usuario_autoriza"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSourceNivelAcceso" ConnectionString='<%$ ConnectionStrings:Registro_RPAConnectionString %>' SelectCommand="SELECT Nivel_Acceso.* FROM Nivel_Acceso" OnUpdating="SqlDataSourceUsuarios_Updating">
    </asp:SqlDataSource>
</asp:Content>
