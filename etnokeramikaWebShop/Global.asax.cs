﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using System.Configuration;
using eshopBL;

namespace etnokeramikaWebShop
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            ///new TransferImages().Start();
            //new CustomRoutes().RegisterRoutes(RouteTable.Routes);
            new RoutesBL().RegisterRoutes();
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (Request.Cookies["cartID"] != null)
                Session.Add("cartID", Request.Cookies["cartID"].Value);
            else
            {
                Guid guid = Guid.NewGuid();
                Session.Add("cartID", guid.ToString());
                HttpCookie cookie = new HttpCookie("cartID");
                cookie.Expires = DateTime.Now.AddDays(10);
                cookie.Value = guid.ToString();
                Response.Cookies.Add(cookie);
            }
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            if(bool.Parse(ConfigurationManager.AppSettings["useSSL"]))
                if (!HttpContext.Current.Request.IsSecureConnection && !HttpContext.Current.Request.IsLocal)
                    Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"] + HttpContext.Current.Request.RawUrl);
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            if (ex is System.Threading.ThreadAbortException)
                return;
            else
            {
                eshopUtilities.ErrorLog.LogError(ex, Request.RawUrl, Request.UserHostAddress, Request.Url.ToString());
                Server.Transfer("~/error.html");
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}