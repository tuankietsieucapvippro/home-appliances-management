using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DoGiaDung_TuanKiet.Models;

namespace DoGiaDung_TuanKiet.Controllers
{
    public class XuatXu_TuanKietController : Controller
    {
        private QLDoGiaDung_TuanKietEntities db = new QLDoGiaDung_TuanKietEntities();

        // GET: XuatXu_TuanKiet
        public ActionResult Index()
        {
            return View(db.XuatXus.ToList());
        }

        // GET: XuatXu_TuanKiet/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            XuatXu xuatXu = db.XuatXus.Find(id);
            if (xuatXu == null)
            {
                return HttpNotFound();
            }
            return View(xuatXu);
        }

        // GET: XuatXu_TuanKiet/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: XuatXu_TuanKiet/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaXuatXu,TenXuatXu,Anh")] XuatXu xuatXu)
        {
            // Check if the provided MaXuatXu already exists
            if (db.XuatXus.Any(x => x.MaXuatXu == xuatXu.MaXuatXu))
            {
                ModelState.AddModelError("MaXuatXu", "Mã xuất xứ đã tồn tại");
            }

            // Check if MaXuatXu is null or empty
            if (string.IsNullOrEmpty(xuatXu.MaXuatXu))
            {
                ModelState.AddModelError("MaXuatXu", "Mã xuất xứ không được để trống");
            }
            if (string.IsNullOrEmpty(xuatXu.TenXuatXu))
            {
                ModelState.AddModelError("TenXuatXu", "Tên xuất xứ không được để trống");
            }
            if (!string.IsNullOrEmpty(xuatXu.Anh))
            {
                string fileExtension = Path.GetExtension(xuatXu.Anh).ToLower();
                string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                if (!allowedExtensions.Contains(fileExtension))
                {
                    ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                }
            }
            if (ModelState.IsValid)
            {
                db.XuatXus.Add(xuatXu);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Xuất xứ mới đã được thêm thành công.";
                return RedirectToAction("Index");
            }

            return View(xuatXu);
        }

        // GET: XuatXu_TuanKiet/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            XuatXu xuatXu = db.XuatXus.Find(id);
            if (xuatXu == null)
            {
                return HttpNotFound();
            }
            return View(xuatXu);
        }

        // POST: XuatXu_TuanKiet/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaXuatXu,TenXuatXu,Anh")] XuatXu xuatXu)
        {
            // Check if the provided MaXuatXu already exists (excluding the current entry)
            if (db.XuatXus.Any(x => x.MaXuatXu == xuatXu.MaXuatXu && x.MaXuatXu != xuatXu.MaXuatXu))
            {
                ModelState.AddModelError("MaXuatXu", "Mã xuất xứ đã tồn tại");
            }

            // Check if MaXuatXu is null or empty
            if (string.IsNullOrEmpty(xuatXu.MaXuatXu))
            {
                ModelState.AddModelError("MaXuatXu", "Mã xuất xứ không được để trống");
            }
            if (string.IsNullOrEmpty(xuatXu.TenXuatXu))
            {
                ModelState.AddModelError("TenXuatXu", "Tên xuất xứ không được để trống");
            }
            if (!string.IsNullOrEmpty(xuatXu.Anh))
            {
                string fileExtension = Path.GetExtension(xuatXu.Anh).ToLower();
                string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                if (!allowedExtensions.Contains(fileExtension))
                {
                    ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                }
            }
            if (ModelState.IsValid)
            {
                // Retrieve the existing entity from the database
                var existingEntity = db.XuatXus.Find(xuatXu.MaXuatXu);
                if (existingEntity == null)
                {
                    return HttpNotFound();
                }

                // Check if Anh is not provided, then use the existing value
                if (string.IsNullOrWhiteSpace(xuatXu.Anh))
                {
                    xuatXu.Anh = existingEntity.Anh;
                }

                // Update the existing entity with the values from the modified object
                db.Entry(existingEntity).CurrentValues.SetValues(xuatXu);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Thông tin xuất xứ đã được cập nhật thành công.";
                return RedirectToAction("Index");
            }

            return View(xuatXu);
        }


        // GET: XuatXu_TuanKiet/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            XuatXu xuatXu = db.XuatXus.Find(id);
            if (xuatXu == null)
            {
                return HttpNotFound();
            }
            return View(xuatXu);
        }

        // POST: XuatXu_TuanKiet/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            XuatXu xuatXu = db.XuatXus.Find(id);
            db.XuatXus.Remove(xuatXu);
            db.SaveChanges();
            TempData["SuccessMessage"] = "Xuất xứ đã được xóa thành công.";
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
