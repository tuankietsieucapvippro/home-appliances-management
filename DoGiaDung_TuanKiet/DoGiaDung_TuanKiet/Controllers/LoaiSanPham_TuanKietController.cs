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
    public class LoaiSanPham_TuanKietController : Controller
    {
        private QLDoGiaDung_TuanKietEntities db = new QLDoGiaDung_TuanKietEntities();

        // GET: LoaiSanPham_TuanKiet
        public ActionResult Index()
        {
            return View(db.LoaiSanPhams.ToList());
        }

        // GET: LoaiSanPham_TuanKiet/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiSanPham loaiSanPham = db.LoaiSanPhams.Find(id);
            if (loaiSanPham == null)
            {
                return HttpNotFound();
            }
            return View(loaiSanPham);
        }

        // GET: LoaiSanPham_TuanKiet/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LoaiSanPham_TuanKiet/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLoaiSanPham,TenLoaiSanPham,Anh,GhiChu")] LoaiSanPham loaiSanPham)
        {
            if (ModelState.IsValid)
            {
                // Check if MaLoaiSanPham or TenLoaiSanPham is empty
                if (string.IsNullOrEmpty(loaiSanPham.MaLoaiSanPham))
                {
                    ModelState.AddModelError("MaLoaiSanPham", "Mã loại sản phẩm không được để trống");
                }

                if (string.IsNullOrEmpty(loaiSanPham.TenLoaiSanPham))
                {
                    ModelState.AddModelError("TenLoaiSanPham", "Tên loại sản phẩm không được để trống");
                }

                // Check if MaLoaiSanPham already exists
                if (db.LoaiSanPhams.Any(l => l.MaLoaiSanPham == loaiSanPham.MaLoaiSanPham))
                {
                    ModelState.AddModelError("MaLoaiSanPham", "Mã loại sản phẩm đã tồn tại");
                }
                if (!string.IsNullOrEmpty(loaiSanPham.Anh))
                {
                    string fileExtension = Path.GetExtension(loaiSanPham.Anh).ToLower();
                    string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                    if (!allowedExtensions.Contains(fileExtension))
                    {
                        ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                    }
                }
                // If there are validation errors, return to the view with the model
                if (!ModelState.IsValid)
                {
                    return View(loaiSanPham);
                }

                // If no validation errors, add to the database and redirect to Index
                db.LoaiSanPhams.Add(loaiSanPham);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Loại sản phẩm mới đã được thêm thành công.";
                return RedirectToAction("Index");
            }

            // If ModelState is not valid, return to the view with the model
            return View(loaiSanPham);
        }


        // GET: LoaiSanPham_TuanKiet/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiSanPham loaiSanPham = db.LoaiSanPhams.Find(id);
            if (loaiSanPham == null)
            {
                return HttpNotFound();
            }
            return View(loaiSanPham);
        }

        // POST: LoaiSanPham_TuanKiet/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaLoaiSanPham,TenLoaiSanPham,Anh,GhiChu")] LoaiSanPham loaiSanPham)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrWhiteSpace(loaiSanPham.MaLoaiSanPham))
                {
                    ModelState.AddModelError("MaLoaiSanPham", "Mã loại sản phẩm không được để trống");
                    return View(loaiSanPham);
                }
                if (string.IsNullOrWhiteSpace(loaiSanPham.TenLoaiSanPham))
                {
                    ModelState.AddModelError("TenLoaiSanPham", "Tên loại sản phẩm không được để trống");
                    return View(loaiSanPham);
                }
                // Check if MaLoaiSanPham already exists (excluding the current record being edited)
                var existingEntity = db.LoaiSanPhams.Find(loaiSanPham.MaLoaiSanPham);
                if (existingEntity == null)
                {
                    return HttpNotFound();
                }

                if (db.LoaiSanPhams.Any(l => l.MaLoaiSanPham == loaiSanPham.MaLoaiSanPham && l.MaLoaiSanPham != existingEntity.MaLoaiSanPham))
                {
                    ModelState.AddModelError("MaLoaiSanPham", "Mã loại sản phẩm đã tồn tại");
                    return View(loaiSanPham);
                }
                if (!string.IsNullOrEmpty(loaiSanPham.Anh))
                {
                    string fileExtension = Path.GetExtension(loaiSanPham.Anh).ToLower();
                    string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                    if (!allowedExtensions.Contains(fileExtension))
                    {
                        ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                    }
                }
                // Check if Anh is not provided, then use the existing value
                if (string.IsNullOrWhiteSpace(loaiSanPham.Anh))
                {
                    loaiSanPham.Anh = existingEntity.Anh;
                }

                // Update the existing entity with the values from the modified object
                db.Entry(existingEntity).CurrentValues.SetValues(loaiSanPham);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Thông tin loại sản phẩm đã được cập nhật thành công.";
                return RedirectToAction("Index");
            }

            return View(loaiSanPham);
        }

        // GET: LoaiSanPham_TuanKiet/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiSanPham loaiSanPham = db.LoaiSanPhams.Find(id);
            if (loaiSanPham == null)
            {
                return HttpNotFound();
            }
            return View(loaiSanPham);
        }

        // POST: LoaiSanPham_TuanKiet/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            LoaiSanPham loaiSanPham = db.LoaiSanPhams.Find(id);
            db.LoaiSanPhams.Remove(loaiSanPham);
            db.SaveChanges();
            TempData["SuccessMessage"] = "Loại sản phẩm đã được xóa thành công.";
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
