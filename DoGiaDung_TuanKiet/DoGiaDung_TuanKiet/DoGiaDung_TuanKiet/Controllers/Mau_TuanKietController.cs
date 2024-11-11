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
    public class Mau_TuanKietController : Controller
    {
        private QLDoGiaDung_TuanKietEntities db = new QLDoGiaDung_TuanKietEntities();

        // GET: Mau_TuanKiet
        public ActionResult Index()
        {
            return View(db.Maus.ToList());
        }

        // GET: Mau_TuanKiet/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mau mau = db.Maus.Find(id);
            if (mau == null)
            {
                return HttpNotFound();
            }
            return View(mau);
        }

        // GET: Mau_TuanKiet/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Mau_TuanKiet/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaMau,TenMau,Anh")] Mau mau)
        {
            if (ModelState.IsValid)
            {
                // Check if MaMau is empty
                if (string.IsNullOrWhiteSpace(mau.MaMau))
                {
                    ModelState.AddModelError("MaMau", "Mã màu không được để trống");
                    
                }
                if (string.IsNullOrWhiteSpace(mau.TenMau))
                {
                    ModelState.AddModelError("TenMau", "Tên màu không được để trống");
                    
                }

                // Check if MaMau is already in use
                if (db.Maus.Any(m => m.MaMau == mau.MaMau))
                {
                    ModelState.AddModelError("MaMau", "Mã màu đã tồn tại");
                    
                }
                if (!string.IsNullOrEmpty(mau.Anh))
                {
                    string fileExtension = Path.GetExtension(mau.Anh).ToLower();
                    string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                    if (!allowedExtensions.Contains(fileExtension))
                    {
                        ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                    }
                }
                if (!ModelState.IsValid)
                {
                    return View(mau);
                }
                db.Maus.Add(mau);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Màu mới đã được thêm thành công.";
                return RedirectToAction("Index");
            }

            return View(mau);
        }

        // GET: Mau_TuanKiet/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mau mau = db.Maus.Find(id);
            if (mau == null)
            {
                return HttpNotFound();
            }
            return View(mau);
        }

        // POST: Mau_TuanKiet/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaMau,TenMau,Anh")] Mau mau)
        {
            if (ModelState.IsValid)
            {
                // Check if MaMau is empty
                if (string.IsNullOrWhiteSpace(mau.MaMau))
                {
                    ModelState.AddModelError("MaMau", "Mã màu không được để trống");
                    return View(mau);
                }
                if (string.IsNullOrWhiteSpace(mau.TenMau))
                {
                    ModelState.AddModelError("TenMau", "Tên màu không được để trống");
                    return View(mau);
                }
                // Check if MaMau is already in use by another record
                if (db.Maus.Any(m => m.MaMau == mau.MaMau && m.MaMau != mau.MaMau))
                {
                    ModelState.AddModelError("MaMau", "Mã màu đã tồn tại");
                    return View(mau);
                }
                if (!string.IsNullOrEmpty(mau.Anh))
                {
                    string fileExtension = Path.GetExtension(mau.Anh).ToLower();
                    string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                    if (!allowedExtensions.Contains(fileExtension))
                    {
                        ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                    }
                }
                // Retrieve the existing entity from the database
                var existingEntity = db.Maus.Find(mau.MaMau);
                if (existingEntity == null)
                {
                    return HttpNotFound();
                }

                // Check if Anh is not provided, then use the existing value
                if (string.IsNullOrWhiteSpace(mau.Anh))
                {
                    mau.Anh = existingEntity.Anh;
                }

                // Update the existing entity with the values from the modified object
                db.Entry(existingEntity).CurrentValues.SetValues(mau);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Thông tin màu đã được cập nhật thành công.";
                return RedirectToAction("Index");
            }

            return View(mau);
        }


        // GET: Mau_TuanKiet/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mau mau = db.Maus.Find(id);
            if (mau == null)
            {
                return HttpNotFound();
            }
            return View(mau);
        }

        // POST: Mau_TuanKiet/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Mau mau = db.Maus.Find(id);
            db.Maus.Remove(mau);
            db.SaveChanges();
            TempData["SuccessMessage"] = "Màu đã được xóa thành công.";
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
