<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TableroPrincipalUsuarioPlantaBaja.aspx.cs" Inherits="RegistroRPA.RegistroRPA.TableroPrincipal.TableroPrincipalUsuarioPlantaBaja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <dx:ASPxGridView ID="ASPxGridViewUsuarioPlantaBaja" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTableroPlantaBajarRPA" KeyFieldName="id" EnableTheming="True" Theme="Office2010Blue">
        <SettingsEditing Mode="EditForm"></SettingsEditing>
        <EditFormLayoutProperties>
            <Items>
                <dx:GridViewLayoutGroup Caption="Registro Usuario RPA">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="Usuario Propietario Registro">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Numero Memorando">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:GridViewLayoutGroup Caption="Datos de la Aeronave">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="Fabricante">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Pais">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Marca">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Modelo">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Numero de Serie">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Tipo de Motorizacion">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="MTOW (Peso maximo de despegue)">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Funciona Paracaidas?">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Equipamento Demostrado">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Autonomia">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:EditModeCommandLayoutItem>
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="id_usuario" VisibleIndex="2" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="num_memorando" VisibleIndex="4" Caption="Numero Memorando"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="fecha_ingreso" VisibleIndex="5" Visible="False"></dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="fecha_aprobacion" VisibleIndex="6" Visible="False"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="numero_registro_guion" ReadOnly="True" VisibleIndex="7" Caption="Numero Registro"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="fabricante" VisibleIndex="8" Caption="Fabricante"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="pais" VisibleIndex="9" Caption="Pais"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="marca" VisibleIndex="10" Caption="Marca"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="modelo" VisibleIndex="11" Caption="Modelo"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="numero_serie" VisibleIndex="12" Caption="Numero de Serie" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="tipo_motorizacion" VisibleIndex="13" Caption="Tipo de Motorizacion" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="mtow" VisibleIndex="14" Caption="MTOW (Peso maximo de despegue)"></dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="paracaidas_funciona" VisibleIndex="15" Caption="Funciona Paracaidas?" Visible="False"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="observaciones" VisibleIndex="16" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="detalle_equipamento_demostrado" VisibleIndex="18" Caption="Equipamento Demostrado" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="1" ReadOnly="True" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowCancelButton="True" VisibleIndex="0" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn FieldName="estado" Visible="False" VisibleIndex="19">
                <PropertiesComboBox DataSourceID="SqlDataSourceEstadoRPA" TextField="nombre" ValueField="codigo">
                    <Columns>
                        <dx:ListBoxColumn FieldName="codigo">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="nombre">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="descripcion">
                        </dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="autonomia" VisibleIndex="17" Caption="Autonomia" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Usuario Propietario Registro" FieldName="id_usuario_propietario" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="SqlDataSourceUsuarioPropietario" TextField="usuario" TextFormatString="{0}; {1}; {2}" ValueField="usuario">
                    <Columns>
                        <dx:ListBoxColumn FieldName="usuario">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="nombre">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="apellido">
                        </dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>

    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceTableroPlantaBajarRPA" ConnectionString='<%$ ConnectionStrings:Registro_RPAConnectionString %>' SelectCommand="SELECT id_usuario, id_usuario_propietario, num_memorando, fecha_ingreso, fecha_aprobacion, estado, numero_registro_guion, fabricante, pais, marca, modelo, numero_serie, tipo_motorizacion, mtow, paracaidas_funciona, observaciones, detalle_equipamento_demostrado, autonomia, id FROM Antecedentes_RPA WHERE (id_usuario = @id_usuario)" InsertCommand="INSERT INTO Antecedentes_RPA(id_usuario, id_usuario_propietario, num_memorando, fecha_ingreso, fabricante, pais, marca, modelo, numero_serie, tipo_motorizacion, mtow, paracaidas_funciona, detalle_equipamento_demostrado, autonomia) VALUES (@id_usuario, @id_usuario_propietario, @num_memorando, @fecha_ingreso, @fabricante, @pais, @marca, @modelo, @numero_serie, @tipo_motorizacion, @mtow, @paracaidas_funciona, @detalle_equipamento_demostrado, @autonomia)" OnInserting="SqlDataSourceTableroPlantaBajarRPA_Inserting" OnSelecting="SqlDataSourceTableroPlantaBajarRPA_Selecting" OnUpdating="SqlDataSourceTableroPlantaBajarRPA_Updating" UpdateCommand="UPDATE Antecedentes_RPA SET id_usuario = @id_usuario, id_usuario_propietario = @id_usuario_propietario, num_memorando = @num_memorando, fabricante = @fabricante, pais = @pais, marca = @marca, modelo = @modelo, numero_serie = @numero_serie, tipo_motorizacion = @tipo_motorizacion, mtow = @mtow, paracaidas_funciona = @paracaidas_funciona, observaciones = @observaciones, detalle_equipamento_demostrado = @detalle_equipamento_demostrado, autonomia = @autonomia WHERE (id = @id)">
        <InsertParameters>
            <asp:Parameter Name="id_usuario" />
            <asp:Parameter Name="id_usuario_propietario" />
            <asp:Parameter Name="num_memorando" />
            <asp:Parameter Name="fecha_ingreso" />
            <asp:Parameter Name="fabricante" />
            <asp:Parameter Name="pais" />
            <asp:Parameter Name="marca" />
            <asp:Parameter Name="modelo" />
            <asp:Parameter Name="numero_serie" />
            <asp:Parameter Name="tipo_motorizacion" />
            <asp:Parameter Name="mtow" />
            <asp:Parameter Name="paracaidas_funciona" />
            <asp:Parameter Name="detalle_equipamento_demostrado" />
            <asp:Parameter Name="autonomia" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_usuario" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_usuario" />
            <asp:Parameter Name="id_usuario_propietario" />
            <asp:Parameter Name="num_memorando" />
            <asp:Parameter Name="fabricante" />
            <asp:Parameter Name="pais" />
            <asp:Parameter Name="marca" />
            <asp:Parameter Name="modelo" />
            <asp:Parameter Name="numero_serie" />
            <asp:Parameter Name="tipo_motorizacion" />
            <asp:Parameter Name="mtow" />
            <asp:Parameter Name="paracaidas_funciona" />
            <asp:Parameter Name="observaciones" />
            <asp:Parameter Name="detalle_equipamento_demostrado" />
            <asp:Parameter Name="autonomia" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>

   

    <asp:SqlDataSource runat="server" ID="SqlDataSourceEstadoRPA" ConnectionString='<%$ ConnectionStrings:Registro_RPAConnectionString %>' SelectCommand="SELECT nombre, descripcion, codigo FROM Estado_Solicitud_RPA"></asp:SqlDataSource>

   

    <asp:SqlDataSource runat="server" ID="SqlDataSourceUsuarioPropietario" ConnectionString='<%$ ConnectionStrings:Registro_RPAConnectionString %>' SelectCommand="SELECT [id], [usuario], [nombre], [apellido] FROM [Tarjeta_RPA]"></asp:SqlDataSource>
</asp:Content>
