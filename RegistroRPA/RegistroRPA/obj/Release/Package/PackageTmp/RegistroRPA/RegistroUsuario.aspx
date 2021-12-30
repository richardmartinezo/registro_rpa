<%@ Page Title="" Language="C#" MasterPageFile="~/Root.Master" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="RegistroRPA.RegistroRPA.AdministracionUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
      <script language="javascript" type="text/javascript">
          function validarclaves() {
              var clavetext = clave.GetText();
              var clavetext2 = clave2.GetText();
              if (clavetext == clavetext2) {
                  clave.SetIsValid(true);
              } else {
                  clave.SetIsValid(false);
              }
          }
</script>
    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%">
       <PanelCollection>
           <dx:PanelContent>

            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Nombre:</td>
                    <td class="auto-style2">
                        <dx:ASPxTextBox ID="txtnombres" runat="server" Width="170px" ClientInstanceName="txtnombres">
                            
                        </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxLabel runat="server" ID="IngresoUsuario" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td>Apellido:</td>
                    <td>
                        <dx:ASPxTextBox ID="txtapellidos" runat="server" Width="170px" ClientInstanceName="txtapellidos">
                           
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email de contacto:</td>
                    <td>
                        <dx:ASPxTextBox ID="txtemail" runat="server"
                             AutoCompleteType="Email" Width="170px" ClientInstanceName="txtemail">
                           
                        </dx:ASPxTextBox>
                        <asp:RegularExpressionValidator Font-Size="12px"
                                             ControlToValidate="txtemail"
                                             Text="Correo invalido."
                                             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                             Runat="Server" />
                    </td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td>
                        <dx:ASPxTextBox ID="txtlogin_usuario" runat="server" Width="170px" ClientInstanceName="txtlogin_usuario">
                           
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <dx:ASPxTextBox ID="txtpassword" runat="server" Password="True" Width="170px" ClientInstanceName="txtpassword" EnableClientSideAPI="True">
                           
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Cédula de Identidad o RUC:</td>
                    <td>
                        <dx:ASPxTextBox ID="txtcedularuc" runat="server"  Width="170px" ClientInstanceName="txtcedularuc" EnableClientSideAPI="True">
                           
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Teléfono:</td>
                    <td>
                        <dx:ASPxTextBox ID="txttelefono" runat="server" Width="170px" ClientInstanceName="txttelefono">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Dirección:</td>
                    <td>
                        <dx:ASPxTextBox ID="txtdireccion" runat="server" Width="170px" ClientInstanceName="txtdireccion">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Celular:</td>
                    <td>
                        <dx:ASPxTextBox ID="txtcelular" runat="server" Width="170px" ClientInstanceName="txtcelular">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <dx:ASPxCaptcha ID="ASPxCaptcha1" runat="server">
                <ValidationSettings SetFocusOnError="True">
                    <RequiredField IsRequired="True" ErrorText="Este campo es requerido!" />
                </ValidationSettings>
                <ChallengeImage ForegroundColor="#000000">
                </ChallengeImage>
            </dx:ASPxCaptcha>
            <br />
            <dx:ASPxButton ID="ASPxButtonCrearUsuario" runat="server" ClientInstanceName="ASPxButtonCrearUsuario" EnableClientSideAPI="True" Text="Crear el usuario" Theme="SoftOrange" OnClick="ASPxButtonCrearUsuario_Click">
                <ClientSideEvents Click="function(s, e) {
 var textoUsuario = txtlogin_usuario.lastChangedValue;
 var textoPassword = txtpassword.lastChangedValue;
 var textoNombre = txtnombres.lastChangedValue;
 var textoApellido = txtapellidos.lastChangedValue;
 var textoEmail = txtemail.lastChangedValue;
 var textoCedulaRuc = txtcedularuc.lastChangedValue;
 var textoDireccion = txtdireccion.lastChangedValue;
 var textoTelefono = txttelefono.lastChangedValue;
 var textoCelular = txtcelular.lastChangedValue;

 if (textoNombre == null) {
              ASPxButtonCrearUsuario.SetVisible(true);       
              alert('Ingrese Nombre');
              return false;
          }else  if(textoApellido == null){
            ASPxButtonCrearUsuario.SetVisible(true);
            alert('Ingrese Apellido');
            
            return false;
          }else if (textoTelefono == null) {  
              ASPxButtonCrearUsuario.SetVisible(true);              
              alert('Ingrese Telefono');
              return false;
          }else  if(textoCedulaRuc == null){
            ASPxButtonCrearUsuario.SetVisible(true);
            alert('Ingrese Cedula Ruc');
            
            return false;
          }else  if(textoDireccion == null){
            ASPxButtonCrearUsuario.SetVisible(true);
            alert('Ingrese Direccion');
            
            return false;
          }else  if(textoCelular == null){
            ASPxButtonCrearUsuario.SetVisible(true);
            alert('Ingrese Celular');
            
            return false;
          }else  if(textoEmail == null){
            ASPxButtonCrearUsuario.SetVisible(true);
            alert('Ingrese e-mail');
            
            return false;
        }else {
            ASPxButtonCrearUsuario.SetVisible(false);
           
            alert('Usuario Ingresado');
            return true;

}
 
                    
}" />
            </dx:ASPxButton>
            <br />
                 

           
    <asp:SqlDataSource ID="SqlDataSourceUsuarioNuevo" runat="server" ConnectionString='<%$ ConnectionStrings:Registro_RPAConnectionString %>' InsertCommand="INSERT INTO Tarjeta_RPA(usuario, password, nombre, apellido, email, CC_RUC, direccion, telefono, celular, fecha_solicita) VALUES (@usuario, @password, @nombre, @apellido, @email, @CC_RUC, @direccion, @telefono, @celular, @fecha_solicita)" SelectCommand="select * from Tarjeta_RPA" OnInserting="SqlDataSourceUsuarioNuevo_Inserting">
        <InsertParameters>
            <asp:ControlParameter Name="usuario" ControlID="txtlogin_usuario" />
            <asp:ControlParameter Name="password" ControlID="txtpassword" />
            <asp:ControlParameter Name="nombre" ControlID="txtnombres"/>
            <asp:ControlParameter Name="apellido" ControlID="txtapellidos"/>
            <asp:ControlParameter Name="email" ControlID="txtemail" />
            <asp:ControlParameter Name="CC_RUC" ControlID="txtcedularuc"/>
            <asp:ControlParameter Name="direccion" ControlID="txtdireccion" />
            <asp:ControlParameter Name="telefono" ControlID="txttelefono" />
            <asp:ControlParameter Name="celular" ControlID="txtcelular" />
            <asp:Parameter Name="fecha_solicita" />
        </InsertParameters>
    </asp:SqlDataSource>
         


     </dx:PanelContent>
       </PanelCollection>
  </dx:ASPxCallbackPanel>
              


</asp:Content>
