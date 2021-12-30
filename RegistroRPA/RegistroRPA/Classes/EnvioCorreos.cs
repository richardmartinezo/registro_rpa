using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
//using iTextSharp.text;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;


namespace RegistroRPA.Classes
{
    public class EnvioCorreos
    {

   

        public bool emailAddressCheck(string correo) {
            string patron = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|"
            + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)"
            + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";
            
            Match emailAddressMatch = Regex.Match(correo, patron);
            if (emailAddressMatch.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        
        }
        //notificaciones de ingreso de usuarios y de usuarios sin adjuntos

        public void enviarNotificacionSinAdjuntos(string direccionFrom, string direccionTo, string tipo_notificacion, string usuario_gestion) {
          //   Byte bytee = new Byte();
            //ingreso de byte para crear un pdf

            //crear correo
            //crear adjunto
           //  Attachment attachment = new Attachment();
            //crear mensaje
             MailMessage notificacion = new MailMessage();
            //crear clientew smtp
             SmtpClient smtp = new SmtpClient("172.20.16.21");
            if (emailAddressCheck(direccionFrom)){
                 notificacion.From = new MailAddress(direccionFrom);
            } else
            {
                notificacion.From = new MailAddress("no_reply@aviacioncivil.gob.ec");
            }
             if (emailAddressCheck(direccionTo)){
                 notificacion.To.Add(direccionTo);
            }else
            {
                notificacion.To.Add("no_reply@aviacioncivil.gob.ec");
            }
             //notificacion.From = new MailAddress(direccionFrom);
             //notificacion.To.Add(direccionTo);

             if (tipo_notificacion.Equals("usuario_nuevo")) {
                 notificacion.Subject = "Usuario " + usuario_gestion+ " ha sido ingresado";
                 notificacion.IsBodyHtml = true;
                 notificacion.Body = "El usuario " + usuario_gestion + " ha sido ingresado exitosamente, favor esperar 24 horas para la validacion del usuario por parte de Registro Aeronautico de la DGAC.";

             }
             else if (tipo_notificacion.Equals("usuario_aprobado"))
             {
                 notificacion.Subject = "Usuario " + usuario_gestion + " ha sido aprobado";
                 notificacion.IsBodyHtml = true;
                 notificacion.Body = "El usuario " + usuario_gestion + " ha sido aprobado exitosamente, ahora puede realizar su tramite en la DGAC con normalidad.";

             }
             else { 
             
             }
            
            smtp.Credentials = new System.Net.NetworkCredential("DGAC\no.reply.ssp", "no.reply.ssp2020");
            smtp.Send(notificacion);


        }

        public void enviarNotifiacionRegistroRPA(string direccionFrom, string direccionTo, string usuario_propietario, string tipo_notificacion, string id_registro, string observaciones) {

            //crear mensaje
            MailMessage notificacion = new MailMessage();
            //crear clientew smtp
            SmtpClient smtp = new SmtpClient("172.20.16.21");
            if (emailAddressCheck(direccionFrom))
            {
                notificacion.From = new MailAddress(direccionFrom);
            }
            else
            {
                notificacion.From = new MailAddress("no_reply@aviacioncivil.gob.ec");
            }
            if (emailAddressCheck(direccionTo))
            {
                notificacion.To.Add(direccionTo);
            }
            else
            {
                notificacion.To.Add("no_reply@aviacioncivil.gob.ec");
            }
            

            if(tipo_notificacion.Equals("RPANuevo"))
            {
                notificacion.Subject = "El registro No.- " + id_registro + " ha sido ingresado";
                notificacion.IsBodyHtml = true;
                notificacion.Body = "El registro No.- " + id_registro + " ha sido ingresado exitosamente, se realizará un proceso de análisis de su solicitud.";

            }
            else if (tipo_notificacion.Equals("RPAModificado"))
            {
                notificacion.Subject = "El registro No.- " + id_registro + " ha sido modificado";
                notificacion.IsBodyHtml = true;
                notificacion.Body = "El registro No.- " + id_registro + " ha sido modificado por el usuario, favor revisar";

            }
            else if (tipo_notificacion.Equals("RegistroAprobado"))
            {
                notificacion.Subject = "El registro No.- " + id_registro + " ha sido aprobado";
                notificacion.IsBodyHtml = true;
                notificacion.Body = "El registro No.- " + id_registro + " ha sido aprobado exitosamente, una vez aprobado el registro se realizará la firma y se enviará el registro a su correo electrónico";
            
            }
            else if (tipo_notificacion.Equals("RegistroPendiente"))
            {
                notificacion.Subject = "El registro No.- " + id_registro + " se encuentra en estado Pendiente";
                notificacion.IsBodyHtml = true;
                notificacion.Body = "El registro No.- " + id_registro + " se encuentra en estado pendiente, favor cambiar los valores especificados en las observaciones del inspector aeronáutico: \n" + observaciones;

            }
            else if (tipo_notificacion.Equals("RegistroArchivado"))
            {
                notificacion.Subject = "El registro No.- " + id_registro + " se encuentra en estado Pendiente";
                notificacion.IsBodyHtml = true;
                notificacion.Body = "El registro No.- " + id_registro + " se encuentra en estado archivado\n";

            }

           

            smtp.Credentials = new System.Net.NetworkCredential("DGAC\no.reply.ssp", "no.reply.ssp2020");
            smtp.Send(notificacion);

        
        
        
        }

        public void enviarNotifiacionRegistroRPAFirmado(string direccionFrom, string direccionTo, string usuario_propietario, string tipo_notificacion, string id_registro)
        {

            //crear mensaje
            MailMessage notificacion = new MailMessage();
            //crear clientew smtp
            SmtpClient smtp = new SmtpClient("172.20.16.21");
            if (emailAddressCheck(direccionFrom))
            {
                notificacion.From = new MailAddress(direccionFrom);
            }
            else
            {
                notificacion.From = new MailAddress("no_reply@aviacioncivil.gob.ec");
            }
            if (emailAddressCheck(direccionTo))
            {
                notificacion.To.Add(direccionTo);
            }
            else
            {
                notificacion.To.Add("no_reply@aviacioncivil.gob.ec");
            }
            //notificacion.From = new MailAddress(direccionFrom);
            //notificacion.To.Add(direccionTo);

            if (tipo_notificacion.Equals("RPAFirmado"))
            {
                notificacion.Subject = "El registro No.- " + id_registro + " ha sido Firmado";
                notificacion.IsBodyHtml = true;
                notificacion.Body = "El registro No.- " + id_registro + " ha sido firmado exitosamente.";

            }
           



            smtp.Credentials = new System.Net.NetworkCredential("DGAC\no.reply.ssp", "no.reply.ssp2020");
            smtp.Send(notificacion);




        }
        public void enviarNotifiacionRegistroRPAFirmadoArchivo(string direccionFrom,
            string direccionTo, 
            string usuario_propietario,
            string tipo_notificacion, 
            string id_registro,
            byte[] pdf,
            string nombrepdf)
        {
            Attachment attachment = new Attachment(new MemoryStream(pdf), nombrepdf);
            //crear mensaje
            MailMessage notificacion = new MailMessage();
            //crear clientew smtp
            SmtpClient smtp = new SmtpClient("172.20.16.21");
            if (emailAddressCheck(direccionFrom))
            {
                notificacion.From = new MailAddress(direccionFrom);
            }
            else
            {
                notificacion.From = new MailAddress("no_reply@aviacioncivil.gob.ec");
            }
            if (emailAddressCheck(direccionTo))
            {
                notificacion.To.Add(direccionTo);
            }
            else
            {
                notificacion.To.Add("no_reply@aviacioncivil.gob.ec");
            }
            
            if (tipo_notificacion.Equals("RPAFirmado"))
            {
                notificacion.Subject = "El registro No.- " + id_registro + " de su credencial RPA se encuentra Firmado";
                notificacion.IsBodyHtml = true;
                notificacion.Body = "El registro No.- " + id_registro + " ha sido enviado a su correo electrónico exitosamente.";
                notificacion.Attachments.Add(attachment);

            }

            smtp.Credentials = new System.Net.NetworkCredential("DGAC\no.reply.ssp", "no.reply.ssp2020");
            smtp.Send(notificacion);




        }
        
    }




}