<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TableroPrincipal.aspx.cs" Inherits="RegistroRPA.RegistroRPA.TableroPrincipal.TableroPrincipal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <script>

          function checkValue() {


              if (ASPxCallbackTableroPrincipal.cpText == "Vacio") {
                   alert("Su solicitud todavia no se encuentra firmada");
                  //ASPxPopupControlCargarArchivo.Show();


              }
              if (ASPxCallbackTableroPrincipal.cpText == "Firmado") {
                  
                  //ASPxPopupControlCargarArchivo.Show();
                  alert("Se ha enviado esta solicitud firmada a su correo electrónico ingresado");


              }

              ASPxCallbackTableroPrincipal.cpText = "ninguno";


          }
</script>
    <script type ="text/javascript">

        
        </script>
     <dx:ASPxCallback ID="ASPxCallbackTableroPrincipal" runat="server" ClientInstanceName="ASPxCallbackTableroPrincipal" OnCallback="ASPxCallbackTableroPrincipal_Callback" >
        <ClientSideEvents EndCallback="function(s, e) {
	checkValue();

}" />
     </dx:ASPxCallback>
    <dx:ASPxGridView ID="ASPxGridViewTableroPrincipal" runat="server" Theme="Office2010Blue" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTableroPrincipal" EnableTheming="True" KeyFieldName="id" OnCustomButtonCallback="ASPxGridViewTableroPrincipal_CustomButtonCallback" OnDetailRowExpandedChanged="ASPxGridViewTableroPrincipal_DetailRowExpandedChanged" OnCellEditorInitialize="ASPxGridViewTableroPrincipal_CellEditorInitialize" OnRowDeleting="ASPxGridViewTableroPrincipal_RowDeleting" OnRowInserted="ASPxGridViewTableroPrincipal_RowInserted">
        <ClientSideEvents EndCallback="function(s, e) {
	ASPxCallbackTableroPrincipal.PerformCallback();
}"></ClientSideEvents>

        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />

        <SettingsEditing Mode="EditForm">
        </SettingsEditing>
        <EditFormLayoutProperties>
            <Items>
                <dx:GridViewLayoutGroup Caption="Informacion Tecnica">
                    <Items>
                        <dx:GridViewColumnLayoutItem Caption="ID" ColumnName="id" Name="ID Usuario" Visible="False">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Fabricante" ColumnName="fabricante">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Modelo" ColumnName="modelo">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Marca" ColumnName="marca">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Numero Serie" ColumnName="numero_serie">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="MTOW (Peso Maximo de Despegue)" ColumnName="mtow">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Funciona Paracaidas" ColumnName="paracaidas_funciona">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Tipo Motorizacion" ColumnName="tipo_motorizacion">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:GridViewLayoutGroup Caption="Informacion Adicional">
                    <Items>
                        <dx:GridViewColumnLayoutItem Caption="Autonomia" ColumnName="autonomia">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Pais" ColumnName="pais">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Detalle Equipamento Demostrado" ColumnName="detalle_equipamento_demostrado">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Path Fotografia" ColumnName="path_fotografia" Visible="False">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:GridViewColumnLayoutItem ColumnName="estado" Visible="False">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem>
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1" Caption="ID">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="id_usuario" VisibleIndex="2" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="fabricante" VisibleIndex="6" Caption="Fabricante"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="pais" VisibleIndex="7" Caption="Pais"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="marca" VisibleIndex="8" Caption="Marca"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="modelo" VisibleIndex="9" Caption="Modelo"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="numero_serie" VisibleIndex="10" Caption="Numero de Serie"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="tipo_motorizacion" VisibleIndex="11" Caption="Tipo de Motorizacion"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="mtow" VisibleIndex="12" Caption="MTOW (Peso Maximo de Despegue)"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="detalle_equipamento_demostrado" VisibleIndex="15" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="autonomia" VisibleIndex="13" Caption="Autonomia"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="path_fotografia" VisibleIndex="16" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="id_usuario_propietario" Visible="False" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="num_memorando" Visible="False" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="numero_registro_guion" VisibleIndex="5" Caption="Numero Registro">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowCancelButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
           
            <dx:GridViewDataComboBoxColumn FieldName="estado" VisibleIndex="17" Caption="Estado">
                <PropertiesComboBox DataSourceID="SqlDataSourceEstadoRPA" TextField="nombre" ValueField="codigo">
                    <Columns>
                        <dx:ListBoxColumn FieldName="nombre">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="codigo">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="descripcion">
                        </dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataCheckColumn FieldName="paracaidas_funciona" VisibleIndex="14" Caption="Paracaidas">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn ShowRecoverButton="False" VisibleIndex="18">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="PDF" Text="PDF Firmado">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
           

           


           
           

           


        </Columns>
    </dx:ASPxGridView>


    <asp:SqlDataSource runat="server" ID="SqlDataSourceTableroPrincipal" ConnectionString='<%$ ConnectionStrings:Registro_RPAConnectionString %>' SelectCommand="SELECT Antecedentes_RPA.id, Antecedentes_RPA.id_usuario, Antecedentes_RPA.fabricante, Antecedentes_RPA.pais, Antecedentes_RPA.marca, Antecedentes_RPA.modelo, Antecedentes_RPA.numero_serie, Antecedentes_RPA.tipo_motorizacion, Antecedentes_RPA.mtow, Antecedentes_RPA.detalle_equipamento_demostrado, Antecedentes_RPA.autonomia, Antecedentes_RPA.path_fotografia, Antecedentes_RPA.id_usuario_propietario, Antecedentes_RPA.num_memorando, Antecedentes_RPA.estado, Antecedentes_RPA.numero_registro_guion, Antecedentes_RPA.paracaidas_funciona, Antecedentes_RPA.observaciones, PDF_Firmado.nombre_archivo, PDF_Firmado.pdf_firmado FROM Antecedentes_RPA LEFT OUTER JOIN PDF_Firmado ON Antecedentes_RPA.id = PDF_Firmado.id_registro_rpa WHERE (Antecedentes_RPA.id_usuario_propietario = @id_usuario_propietario)"
         OnSelecting="SqlDataSourceTableroPrincipal_Selecting" 
        InsertCommand="INSERT INTO Antecedentes_RPA(id_usuario, id_usuario_propietario, 
        num_memorando, fecha_ingreso, estado, fabricante, pais, marca, modelo,
         numero_serie, tipo_motorizacion, mtow, paracaidas_funciona, observaciones, 
        detalle_equipamento_demostrado, autonomia) VALUES (@id_usuario, @id_usuario_propietario,
         @num_memorando, @fecha_ingreso, @estado, @fabricante, @pais, @marca, @modelo, @numero_serie,
         @tipo_motorizacion, @mtow, @paracaidas_funciona, @observaciones, @detalle_equipamento_demostrado, @autonomia)" 
        UpdateCommand="UPDATE Antecedentes_RPA SET id_usuario_propietario = @id_usuario_propietario, fecha_ingreso =
         @fecha_ingreso, estado = @estado, fabricante = @fabricante, pais = @pais, marca = @marca, modelo = @modelo, 
        numero_serie = @numero_serie, tipo_motorizacion = @tipo_motorizacion, mtow = @mtow, paracaidas_funciona = @paracaidas_funciona, 
        observaciones = @observaciones, detalle_equipamento_demostrado = @detalle_equipamento_demostrado, autonomia = @autonomia, id_usuario = @id_usuario WHERE (id = @id)" 
        OnInserting="SqlDataSourceTableroPrincipal_Inserting" OnUpdating="SqlDataSourceTableroPrincipal_Updating" OnInserted="SqlDataSourceTableroPrincipal_Inserted">
        <InsertParameters>
            <asp:Parameter Name="id_usuario" />
            <asp:Parameter Name="id_usuario_propietario" />
            <asp:Parameter Name="num_memorando" />
            <asp:Parameter Name="fecha_ingreso" />
            <asp:Parameter Name="estado" />
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
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_usuario_propietario"></asp:Parameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_usuario_propietario" />
            <asp:Parameter Name="fecha_ingreso" />
            <asp:Parameter Name="estado" />
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
            <asp:Parameter Name="id_usuario" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource runat="server" ID="SqlDataSourceEstadoRPA" ConnectionString='<%$ ConnectionStrings:Registro_RPAConnectionString %>' SelectCommand="SELECT nombre, descripcion, codigo, id FROM Estado_Solicitud_RPA" OnSelecting="SqlDataSourceEstadoRPA_Selecting">
    </asp:SqlDataSource>


    <asp:SqlDataSource runat="server" ID="SqlDataSourceDescargarArchivo" ConnectionString='<%$ ConnectionStrings:Registro_RPAConnectionString %>' SelectCommand="SELECT id_registro_rpa, nombre_archivo, pdf_firmado, id, content_type FROM PDF_Firmado WHERE (id_registro_rpa = @id_registro_rpa)" OnSelecting="SqlDataSourceDescargarArchivo_Selecting">
        <SelectParameters>
            <asp:Parameter Name="id_registro_rpa" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
