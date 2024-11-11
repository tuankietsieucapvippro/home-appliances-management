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
    public class NhaSanXuat_TuanKietController : Controller
    {
        private QLDoGiaDung_TuanKietEntities db = new QLDoGiaDung_TuanKietEntities();

        // GET: NhaSanXuat_TuanKiet
        public ActionResult Index()
        {
            return View(db.NhaSanXuats.ToList());
        }

        // GET: NhaSanXuat_TuanKiet/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaSanXuat nhaSanXuat = db.NhaSanXuats.Find(id);
            if (nhaSanXuat == null)
            {
                return HttpNotFound();
            }
            return View(nhaSanXuat);
        }

        // GET: NhaSanXuat_TuanKiet/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: NhaSanXuat_TuanKiet/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNhaSanXuat,TenNhaSanXuat,Anh,GhiChu")] NhaSanXuat nhaSanXuat)
        {
            // Check if the provided MaNhaSanXuat already exists
            if (db.NhaSanXuats.Any(x => x.MaNhaSanXuat == nhaSanXuat.MaNhaSanXuat))
            {
                ModelState.AddModelError("MaNhaSanXuat", "Mã nhà sản xuất đã tồn tại");
            }

            // Check if MaNhaSanXuat is empty
            if (string.IsNullOrEmpty(nhaSanXuat.MaNhaSanXuat))
            {
                ModelState.AddModelError("MaNhaSanXuat", "Mã nhà sản xuất không được để trống");
            }
            if (string.IsNullOrEmpty(nhaSanXuat.TenNhaSanXuat))
            {
                ModelState.AddModelError("TenNhaSanXuat", "Tên nhà sản xuất không được để trống");
            }
            if (!string.IsNullOrEmpty(nhaSanXuat.Anh))
            {
                string fileExtension = Path.GetExtension(nhaSanXuat.Anh).ToLower();
                string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                if (!allowedExtensions.Contains(fileExtension))
                {
                    ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                }
            }
            if (ModelState.IsValid)
            {
                db.NhaSanXuats.Add(nhaSanXuat);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Nhà sản xuất mới đã được thêm thành công.";
                return RedirectToAction("Index");
            }

            return View(nhaSanXuat);
        }

        // GET: NhaSanXuat_TuanKiet/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaSanXuat nhaSanXuat = db.NhaSanXuats.Find(id);
            if (nhaSanXuat == null)
            {
                return HttpNotFound();
            }
            return View(nhaSanXuat);
        }

        // POST: NhaSanXuat_TuanKiet/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNhaSanXuat,TenNhaSanXuat,Anh,GhiChu")] NhaSanXuat nhaSanXuat)
        {
            // Check if the provided MaNhaSanXuat already exists (excluding the current record)
            var existingEntity = db.NhaSanXuats.Find(nhaSanXuat.MaNhaSanXuat);
            if (existingEntity == null)
            {
                return HttpNotFound();
            }

            if (db.NhaSanXuats.Any(x => x.MaNhaSanXuat == nhaSanXuat.MaNhaSanXuat && x.MaNhaSanXuat != existingEntity.MaNhaSanXuat))
            {
                ModelState.AddModelError("MaNhaSanXuat", "Mã nhà sản xuất đã tồn tại");
            }

            // Check if MaNhaSanXuat is empty
            if (string.IsNullOrEmpty(nhaSanXuat.MaNhaSanXuat))
            {
                ModelState.AddModelError("MaNhaSanXuat", "Mã nhà sản xuất không được để trống");
            }
            if (string.IsNullOrEmpty(nhaSanXuat.TenNhaSanXuat))
            {
                ModelState.AddModelError("TenNhaSanXuat", "Tên nhà sản xuất không được để trống");
            }
            if (!string.IsNullOrEmpty(nhaSanXuat.Anh))
            {
                string fileExtension = Path.GetExtension(nhaSanXuat.Anh).ToLower();
                string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                if (!allowedExtensions.Contains(fileExtension))
                {
                    ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                }
            }
            if (ModelState.IsValid)
            {
                // Check if Anh is not provided, then use the existing value
                if (string.IsNullOrWhiteSpace(nhaSanXuat.Anh))
                {
                    nhaSanXuat.Anh = existingEntity.Anh;
                }

                // Update the existing entity with the values from the modified object
                db.Entry(existingEntity).CurrentValues.SetValues(nhaSanXuat);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Thông tin nhà sản xuất đã được cập nhật thành công.";
                return RedirectToAction("Index");
            }

            return View(nhaSanXuat);
        }


        // GET: NhaSanXuat_TuanKiet/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaSanXuat nhaSanXuat = db.NhaSanXuats.Find(id);
            if (nhaSanXuat == null)
            {
                return HttpNotFound();
            }
            return View(nhaSanXuat);
        }

        // POST: NhaSanXuat_TuanKiet/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            NhaSanXuat nhaSanXuat = db.NhaSanXuats.Find(id);
            db.NhaSanXuats.Remove(nhaSanXuat);
            db.SaveChanges();
            TempData["SuccessMessage"] = "Nhà sản xuất đã được xóa thành công.";
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
