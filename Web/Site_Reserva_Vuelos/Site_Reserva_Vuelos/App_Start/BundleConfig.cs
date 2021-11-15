using System.Web;
using System.Web.Optimization;

namespace Site_Reserva_Vuelos
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/popper").Include(
                      "~/Scripts/umd/popper.js"));

            bundles.Add(new Bundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"
                      ));

            bundles.Add(new Bundle("~/bundles/datatable").Include(
                      "~/Scripts/jquery_datatable/datatable.min.js"
                      ));

            bundles.Add(new StyleBundle("~/bundles/css/datatable").Include(
                      "~/Content/jquery_datatable/datatables.min.css"
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/fontawesome.min.css",
                      "~/Content/solid.min.css",
                      "~/Content/regular.min.css",
                      "~/Recursos/Css/default.css",
                      "~/Content/site.css"
                      ));
        }
    }
}
