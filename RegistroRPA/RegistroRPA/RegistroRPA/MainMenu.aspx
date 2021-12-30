<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="RegistroRPA.RegistroRPA.MainMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table>
        <tr>
            <td>
                <dx:ASPxButton ID="ASPxButtonAdministracionUsuario" runat="server" Text="Administrar Usuarios" OnClick="ASPxButtonAdministracionUsuario_Click">
                    <Image Url="~/Images/MainMenu/96px/chat, communication, conversation, text, message_96px.png">
                    </Image>
                </dx:ASPxButton>

            </td>
            <td>

                <dx:ASPxButton ID="ASPxButtonTableroPrincipal" runat="server" Text="Tablero Principal " OnClick="ASPxButtonTableroPrincipal_Click">
                    <Image Url="~/Images/MainMenu/96px/innovation, innovative, review, dollar, settings, chart_96px.png">
                    </Image>
                </dx:ASPxButton>

            </td>

             <td>

                 <dx:ASPxButton ID="ASPxButtonPersonalFirmador" runat="server" Text="Firmar Registro RPA" OnClick="ASPxButtonPersonalFirmador_Click">
                     <Image Url="~/Images/MainMenu/96px/receipt, finance, payment, ecommerce, commerce_96px.png">
                     </Image>
                 </dx:ASPxButton>

            </td>

             <td>

                 <dx:ASPxButton ID="ASPxButtonPlantaBaja" runat="server" Text="Ingreso Planta Baja" OnClick="ASPxButtonPlantaBaja_Click">
                     <Image Url="~/Images/MainMenu/96px/call, center, conversation, communication, support, international_96px.png">
                     </Image>
                 </dx:ASPxButton>

            </td>
             <td>

                 <dx:ASPxButton ID="ASPxButtonRegistroAeronautico" runat="server" Text="Tablero Principal Registro Aeronautico" OnClick="ASPxButtonRegistroAeronautico_Click">
                     <Image Url="~/Images/MainMenu/96px/virtual, reality, projection, person, user, gamer_96px.png">
                     </Image>
                 </dx:ASPxButton>

            </td>


        </tr>

     </table>

</asp:Content>
