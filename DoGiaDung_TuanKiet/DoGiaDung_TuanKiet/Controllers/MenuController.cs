using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoGiaDung_TuanKiet.Models;
using System.Collections;

namespace DoGiaDung_TuanKiet.Controllers
{
    public class MenuController : Controller
    {
        // GET: Menu
        public ActionResult Index()
        {
            using (QLDoGiaDung_TuanKietEntities db = new QLDoGiaDung_TuanKietEntities())
            {
                var loaiSanPham = db.LoaiSanPhams.ToList();
                Hashtable tenLoaiSanPham = new Hashtable();
                foreach(var item in loaiSanPham)
                {
                    tenLoaiSanPham.Add(item.MaLoaiSanPham, item.TenLoaiSanPham);
                }
                ViewBag.TenLoaiSanPham = tenLoaiSanPham;
                return PartialView("Index");
            }
            
        }
    }
}