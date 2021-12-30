<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TableroPrincipalFirmador.aspx.cs" Inherits="RegistroRPA.RegistroRPA.TableroPrincipal.TableroPrincipalFirmador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script>

         function checkValue() {

           //  alert("llego1");
           //  alert(ASPxCallbackFirma.cpText);
           //  alert(ASPxCallbackFirma.cpText);
             if (ASPxCallbackFirma.cpText == "Reporte") {
                 //  alert("llego");
                 ASPxPopupControlReporteRPA.Show();
                 //ASPxPopupControl1.Show();
                 // ASPxPopupControl1.Show

             }
            
             if (ASPxCallbackFirma.cpText == "CargarArchivo") {
                  // alert("carga archivo");
                 ASPxPopupControlCargarArchivo.Show();
                

             }

             ASPxCallbackFirma.cpText = "ninguno";


         }
</script>
    <script type ="text/javascript">

        
        </script>
    <dx:ASPxCallback ID="ASPxCallbackFirma" runat="server" ClientInstanceName="ASPxCallbackFirma" OnCallback="ASPxCallbackFirma_Callback">
        <ClientSideEvents EndCallback="function(s, e) {
	checkValue();

}" />
     </dx:ASPxCallback>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTableroRPA" EnableTheming="True" Theme="Office2010Blue" KeyFieldName="id" OnCustomButtonCallback="ASPxGridView1_CustomButtonCallback">
        <ClientSideEvents EndCallback="function(s, e) {
	ASPxCallbackFirma.PerformCallback();
}"></ClientSideEvents>

        <SettingsPager PageSize="15">
        </SettingsPager>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="id_usuario" VisibleIndex="1" Caption="Usuario que Ingresa">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="id_usuario_propietario" VisibleIndex="2" Caption="Usuario Propietario">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="num_memorando" VisibleIndex="3" Caption="Memorando que Ingresa">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="fecha_aprobacion" VisibleIndex="4" Caption="Fecha Aprobacion">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="estado" VisibleIndex="7" Caption="Estado">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="fecha_ingreso" VisibleIndex="5" Caption="Fecha Ingreso">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="numero_registro" ReadOnly="True" VisibleIndex="6" Caption="Numero Registro">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="firmado" VisibleIndex="8" Caption="Firmado" Visible="False">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="PDF" Text="PDF">
                        <Image Url="~/Images/MainMenu/48px/woman, user, account, gamer, virtual, reality, glasses_48px.png">
                        </Image>
                    </dx:GridViewCommandColumnCustomButton>
                    <dx:GridViewCommandColumnCustomButton ID="Upload" Text="Cargar Archivo">
                        <Image Url="~/Images/MainMenu/48px/location, pointer, map, destination, pin_48px.png">
                        </Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSourceTableroRPA" runat="server" ConnectionString="<%$ ConnectionStrings:Registro_RPAConnectionString %>" SelectCommand="SELECT id, id_usuario, id_usuario_propietario, num_memorando, fecha_aprobacion, estado, fecha_ingreso, numero_registro, firmado FROM Antecedentes_RPA WHERE (estado = 'A')" UpdateCommand="UPDATE Antecedentes_RPA SET firmado = @firmado WHERE (id = @id)">
        <UpdateParameters>
            <asp:Parameter Name="firmado" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourcePDFFirmado" runat="server" ConnectionString="<%$ ConnectionStrings:Registro_RPAConnectionString %>" SelectCommand="SELECT id, id_registro_rpa, pdf_firmado, nombre_archivo FROM PDF_Firmado " UpdateCommand="UPDATE PDF_Firmado SET id_registro_rpa = @id_registro_rpa, nombre_archivo = @nombre_archivo, pdf_firmado = @pdf_firmado WHERE (id = @id)" InsertCommand="INSERT INTO PDF_Firmado(id_registro_rpa, pdf_firmado, nombre_archivo) VALUES (@id_registro_rpa, @pdf_firmado, @nombre_archivo)">
        <InsertParameters>
            <asp:Parameter Name="id_registro_rpa"></asp:Parameter>
            <asp:Parameter Name="pdf_firmado"></asp:Parameter>
            <asp:Parameter Name="nombre_archivo"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_registro_rpa" />
            <asp:Parameter Name="nombre_archivo" />
            <asp:Parameter Name="pdf_firmado"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <dx:ASPxPopupControl ID="ASPxPopupControlReporteRPA" runat="server" ClientInstanceName="ASPxPopupControlReporteRPA" HeaderText="Reporte RPA">
         <ClientSideEvents Shown="function(s, e) {
	ASPxPopupControlReporteRPA.RefreshContentUrl();}" />

                                    <ContentCollection>
                                        <dx:PopupControlContentControl runat="server">
                                        </dx:PopupControlContentControl>
                                    </ContentCollection>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="ASPxPopupControlCargarArchivo" runat="server" ClientInstanceName="ASPxPopupControlCargarArchivo" HeaderText="Cargar Archivo Firmado" Height="240px" Width="290px">
        <ClientSideEvents Shown="function(s, e) {
	ASPxPopupControlCargarArchivo.RefreshContentUrl(); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
            </dx:PopupControlContentControl>
        </ContentCollection>
     
    </dx:ASPxPopupControl>
</asp:Content>
