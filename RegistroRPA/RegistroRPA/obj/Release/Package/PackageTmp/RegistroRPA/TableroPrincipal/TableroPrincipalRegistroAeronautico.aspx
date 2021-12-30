<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TableroPrincipalRegistroAeronautico.aspx.cs" Inherits="RegistroRPA.RegistroRPA.TableroPrincipal.TableroPrincipalRegistroAeronautico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRegistradorAeronautico" EnableTheming="True" Theme="Office2010Blue" KeyFieldName="id" OnStartRowEditing="ASPxGridView1_StartRowEditing">
    <SettingsEditing Mode="EditForm">
    </SettingsEditing>
    <EditFormLayoutProperties ColCount="2">
        <Items>
            <dx:GridViewLayoutGroup Caption="Identificacion de Registro RPA" ColSpan="2">
                <Items>
                    <dx:GridViewColumnLayoutItem Caption="ID" ColumnName="id">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Usuario que Ingresa Solicitud" ColumnName="id_usuario">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Usuario Propietario RPA" ColumnName="id_usuario_propietario">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Numero Memorando Fisico" ColumnName="num_memorando">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Fecha de Ingreso" ColumnName="fecha_ingreso">
                    </dx:GridViewColumnLayoutItem>
                </Items>
            </dx:GridViewLayoutGroup>
            <dx:GridViewLayoutGroup Caption="Datos Técnicos RPA" ColCount="2" ColSpan="2">
                <Items>
                    <dx:GridViewColumnLayoutItem Caption="Numero Registro" ColumnName="numero_registro_guion">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Fabricante" ColumnName="fabricante">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Pais" ColumnName="pais">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Marca" ColumnName="marca">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Modelo" ColumnName="modelo">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Numero de Serie" ColumnName="numero_serie">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Tipo de Motorizacion" ColumnName="tipo_motorizacion">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="MTOW (Peso Máximo de Despegue)" ColumnName="mtow">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Funciona el Paracaidas?" ColumnName="paracaidas_funciona">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Detalle Equipamiento Demostrado" ColumnName="detalle_equipamento_demostrado">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Autonomia" ColumnName="autonomia">
                    </dx:GridViewColumnLayoutItem>
                </Items>
            </dx:GridViewLayoutGroup>
            <dx:GridViewLayoutGroup Caption="Registro Aeronautico" ColSpan="2">
                <Items>
                    <dx:GridViewColumnLayoutItem Caption="Estado Registro RPA" ColumnName="estado">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="fecha_aprobacion" Visible="False">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem Caption="Observaciones" ColumnName="observaciones">
                    </dx:GridViewColumnLayoutItem>
                </Items>
            </dx:GridViewLayoutGroup>
            <dx:EditModeCommandLayoutItem ColSpan="2" Name="Controles">
            </dx:EditModeCommandLayoutItem>
        </Items>
    </EditFormLayoutProperties>
    <Columns>
        <dx:GridViewDataTextColumn Caption="Usuario Ingresa" FieldName="id_usuario" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Usuario Propietario" FieldName="id_usuario_propietario" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Numero Memorando" FieldName="num_memorando" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Fecha Ingreso" FieldName="fecha_ingreso" VisibleIndex="5">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="fecha_aprobacion" Visible="False" VisibleIndex="6">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Numero Registro" FieldName="numero_registro_guion" ReadOnly="True" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="numero_registro" ReadOnly="True" Visible="False" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Fabricante" FieldName="fabricante" Visible="False" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Pais" FieldName="pais" Visible="False" VisibleIndex="10">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Marca" FieldName="marca" Visible="False" VisibleIndex="11">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Modelo" FieldName="modelo" VisibleIndex="12">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Numero Serie" FieldName="numero_serie" VisibleIndex="13">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="tipo_motorizacion" Visible="False" VisibleIndex="14">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="mtow" Visible="False" VisibleIndex="15">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn Caption="Funciona Paracaidas?" FieldName="paracaidas_funciona" VisibleIndex="16">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataTextColumn FieldName="detalle_equipamento_demostrado" Visible="False" VisibleIndex="18">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="autonomia" Visible="False" VisibleIndex="19">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn Caption="Firmado" FieldName="firmado" VisibleIndex="21">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="ID" FieldName="id" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn FieldName="observaciones" Visible="False" VisibleIndex="17">
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="estado" VisibleIndex="20">
            <PropertiesComboBox DataSourceID="SqlDataSourceEstadoRegistroRPA" TextField="nombre" TextFormatString="{0}; {1}; {2}" ValueField="codigo">
                <Columns>
                    <dx:ListBoxColumn Caption="Nombre" FieldName="nombre">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn Caption="Descripcion" FieldName="descripcion">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn Caption="Código" FieldName="codigo">
                    </dx:ListBoxColumn>
                </Columns>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSourceRegistradorAeronautico" runat="server" ConnectionString="<%$ ConnectionStrings:Registro_RPAConnectionString %>" SelectCommand="SELECT [id_usuario], [id_usuario_propietario], [num_memorando], [fecha_ingreso], [fecha_aprobacion], [estado], [numero_registro_guion], [numero_registro], [fabricante], [pais], [marca], [modelo], [numero_serie], [tipo_motorizacion], [mtow], [paracaidas_funciona], [observaciones], [detalle_equipamento_demostrado], [autonomia], [firmado], [id] FROM [Antecedentes_RPA]" UpdateCommand="UPDATE Antecedentes_RPA SET fecha_aprobacion = @fecha_aprobacion, estado = @estado, observaciones = @observaciones WHERE (id = @id)" OnUpdating="SqlDataSourceRegistradorAeronautico_Updating">
    <UpdateParameters>
        <asp:Parameter Name="fecha_aprobacion" />
        <asp:Parameter Name="estado" />
        <asp:Parameter Name="observaciones" />
        <asp:Parameter Name="id" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceEstadoRegistroRPA" runat="server" ConnectionString="<%$ ConnectionStrings:Registro_RPAConnectionString %>" SelectCommand="SELECT Estado_Solicitud_RPA.* FROM Estado_Solicitud_RPA"></asp:SqlDataSource>
</asp:Content>
