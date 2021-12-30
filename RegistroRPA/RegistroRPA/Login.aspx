<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RegistroRPA.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%">
       <PanelCollection>
           <dx:PanelContent>
                <h3>Login de Usuario:</h3>
    
               <table>
                   <tr>
                       <td class="style10">Usuario:</td>
                       <td class="auto-style5">
                           <asp:TextBox ID="TextUser" runat="server"></asp:TextBox>
                       </td>
                       <td class="style4" rowspan="3">
                           <dx:ASPxButton ID="ASPxButtonlogin" runat="server" Text="Ingresar" EnableTheming="True" Theme="SoftOrange" OnClick="ASPxButtonlogin_Click">
                           </dx:ASPxButton>

                       </td>
                       <td>
                           <dx:ASPxLabel ID="ASPxLabelUsuarioValidacion" runat="server" Text=""></dx:ASPxLabel>

                       </td>
                   </tr>
                   <tr>
                       <td class="style13">Password:</td>
                       <td class="auto-style6">
                           <asp:TextBox ID="TextPass" runat="server" TextMode="Password"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <br></br>
                           <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#0000CC" NavigateUrl="~/RegistroRPA/RegistroUsuario.aspx">Crear una cuenta nueva</asp:HyperLink>
                       </td>
                   </tr>

               </table>
            

     </dx:PanelContent>
       </PanelCollection>
  </dx:ASPxCallbackPanel>
       
</asp:Content>
