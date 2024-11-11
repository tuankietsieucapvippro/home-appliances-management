using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using DoGiaDung_TuanKiet.Models;

namespace DoGiaDung_TuanKiet.Controllers
{
    public class HomeController : Controller
    {
        QLDoGiaDung_TuanKietEntities  db = new QLDoGiaDung_TuanKietEntities();
        public ActionResult Index()
        {
            var sanPhams = db.SanPhams.Include(s => s.LoaiSanPham);
            return View(sanPhams.ToList());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}