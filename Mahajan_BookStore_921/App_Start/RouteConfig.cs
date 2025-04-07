using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace Mahajan_BookStore_921
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);

            routes.Ignore("{resource}.axd/{*pathInfo}");

            routes.MapPageRoute("Default", "BookStore/Default", "~/Default.aspx");
            routes.MapPageRoute("ShopCart", "BookStore/Cart", "~/Cart.aspx");
            routes.MapPageRoute("ShopProduct", "BookStore/Products", "~/Products_921.aspx");
            routes.MapPageRoute("Login", "BookStore/LoginPage", "~/LoginPage.aspx");
            routes.MapPageRoute("CheckOut", "BookStore/Checkout", "~/Checkout_8921.aspx");

            //routes.MapPageRoute("ShopOrder", "Shop/Order/{productID}", "~/Order.aspx", false,
            //    new RouteValueDictionary { { "productID", "" } });
        }
    }
}
