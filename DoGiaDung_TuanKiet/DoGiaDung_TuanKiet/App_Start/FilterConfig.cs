using System.Web;
using System.Web.Mvc;

namespace DoGiaDung_TuanKiet
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
