using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MercaFast.MasterPage
{
    
    public partial class Site1 : System.Web.UI.MasterPage
    { 

        
        protected void Page_Load(object sender, EventArgs e)
        {

            var VarSessionAD = HttpContext.Current.Session["UserLogin2"];
            var VarSessionCL = HttpContext.Current.Session["UserLogin"];
            if (VarSessionAD == null && VarSessionCL == null)
            {
                ImageButton3.Visible = false;
            }else if (VarSessionAD != null)
            {
                ImageButton3.Visible = false;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            var VarSessionCL = HttpContext.Current.Session["UserLogin"];
            var VarSessionAD = HttpContext.Current.Session["UserLogin2"];

            if (VarSessionCL != null)
            {
                Response.Redirect("/Modulos/CuentaCliente.aspx");
            }else if (VarSessionAD!=null)
            {
                Response.Redirect("/Modulos/CuentaAdmin.aspx");
            }
            else 
            {
                Response.Redirect("/Modulos/Login.aspx");
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            var VarSessionCL = HttpContext.Current.Session["UserLogin"];
            var VarSessionAD = HttpContext.Current.Session["UserLogin2"];

            if (VarSessionCL != null)
            {
                Response.Redirect("/Modulos/CuentaCliente.aspx");
            }
            else if (VarSessionAD != null)
            {
                Response.Redirect("/Modulos/CuentaAdmin.aspx");
            }
            else
            {
                Response.Redirect("/Modulos/Login.aspx");
            }
        }
    }
}