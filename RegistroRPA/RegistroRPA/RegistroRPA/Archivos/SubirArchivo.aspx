<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubirArchivo.aspx.cs" Inherits="RegistroRPA.RegistroRPA.SubirArchivo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Height="200px" Width="280px">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxUploadControl ID="ASPxUploadControlArchivoFirmado" runat="server" style="margin-bottom: 40px"
         UploadMode="Auto" Width="280px" OnFileUploadComplete="ASPxUploadControlArchivoFirmado_FileUploadComplete" 
        ShowProgressPanel="True" ShowUploadButton="True" Theme="Office2010Blue">
        <ValidationSettings AllowedFileExtensions=".pdf" GeneralErrorText="Error" MaxFileCount="1" NotAllowedFileExtensionErrorText="No se permiten archivos diferentes a PDF">
        </ValidationSettings>
        <UploadButton Text="Subir Archivo Firmado RPA">
        </UploadButton>
        <AdvancedModeSettings EnableDragAndDrop="True">
        </AdvancedModeSettings>
    </dx:ASPxUploadControl>
    <asp:SqlDataSource ID="SqlDataSourcePDFFirmado" runat="server" ConnectionString="<%$ ConnectionStrings:Registro_RPAConnectionString %>" InsertCommand="INSERT INTO PDF_Firmado(id_registro_rpa, pdf_firmado, nombre_archivo, content_type) VALUES (@id_registro_rpa, @pdf_firmado, @nombre_archivo, @content_type)" SelectCommand="SELECT id, id_registro_rpa, nombre_archivo, pdf_firmado, is_folder, last, content_type FROM PDF_Firmado WHERE (id_registro_rpa = @id_registro_rpa)" UpdateCommand="UPDATE PDF_Firmado SET pdf_firmado = @pdf_firmado, nombre_archivo = @nombre_archivo, content_type = @content_type WHERE (id_registro_rpa = @id_registro_rpa)" OnInserting="SqlDataSourcePDFFirmado_Inserting" OnSelecting="SqlDataSourcePDFFirmado_Selecting" OnUpdating="SqlDataSourcePDFFirmado_Updating">
        <InsertParameters>
            <asp:Parameter Name="id_registro_rpa" />
            <asp:Parameter Name="pdf_firmado" />
            <asp:Parameter Name="nombre_archivo"></asp:Parameter>
            <asp:Parameter Name="content_type" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_registro_rpa"></asp:Parameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="pdf_firmado" />
            <asp:Parameter Name="nombre_archivo" />
            <asp:Parameter Name="content_type" />
            <asp:Parameter Name="id_registro_rpa" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEstadoFirmado" runat="server" ConnectionString="<%$ ConnectionStrings:Registro_RPAConnectionString %>" OnSelecting="SqlDataSourceEstadoFirmado_Selecting" OnUpdating="SqlDataSourceEstadoFirmado_Updating" SelectCommand="SELECT id, id_usuario, id_usuario_propietario, firmado FROM Antecedentes_RPA WHERE (id = @id_registro_rpa)" UpdateCommand="UPDATE Antecedentes_RPA SET firmado = @firmado where id = @id_registro_rpa">
        <SelectParameters>
            <asp:Parameter Name="id_registro_rpa" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="firmado" />
            <asp:Parameter Name="id_registro_rpa" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceUsuarioPropietario" runat="server" ConnectionString="<%$ ConnectionStrings:Registro_RPAConnectionString %>" OnSelecting="SqlDataSourceUsuarioPropietario_Selecting" SelectCommand="SELECT id, usuario, email FROM Tarjeta_RPA WHERE (usuario = @id_usuario_propietario)">
        <SelectParameters>
            <asp:Parameter Name="id_usuario_propietario" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxPanel>
    
    &nbsp;</div>
    </form>
</body>
</html>
