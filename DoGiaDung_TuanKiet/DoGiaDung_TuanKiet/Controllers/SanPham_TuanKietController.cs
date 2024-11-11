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
    public class SanPham_TuanKietController : Controller
    {
        private QLDoGiaDung_TuanKietEntities db = new QLDoGiaDung_TuanKietEntities();

        // GET: SanPham_TuanKiet
        public ActionResult Index(string maLoaiSanPham = "0")
        {
            if(maLoaiSanPham == "0")
            {
                var sanPhams = db.SanPhams.Include(s => s.LoaiSanPham).Include(s => s.Mau).Include(s => s.NhaSanXuat).Include(s => s.XuatXu);
                return View(sanPhams.ToList());
            }    
            else
            {
                var sanPhams = db.SanPhams.Include(s => s.LoaiSanPham).Include(s => s.Mau).Include(s => s.NhaSanXuat).Include(s => s.XuatXu).Where(x => x.MaLoaiSanPham == maLoaiSanPham) ;
                return View(sanPhams.ToList());
            }    


        }

        // GET: SanPham_TuanKiet/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: SanPham_TuanKiet/Create
        public ActionResult Create()
        {
            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham");
            ViewBag.MaMau = new SelectList(db.Maus, "MaMau", "TenMau");
            ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat");
            ViewBag.MaXuatXu = new SelectList(db.XuatXus, "MaXuatXu", "TenXuatXu");
            return View();
        }

        // POST: SanPham_TuanKiet/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSanPham,TenSanPham,GiaTien,MaLoaiSanPham,MaNhaSanXuat,SoLuong,Anh,GhiChu,KichThuocKhoiLuong,NamSanXuat,MaMau,MaXuatXu,ChatLieu")] SanPham sanPham)
        {
            // Check if SoLuong is less than or equal to 0
            if (sanPham.SoLuong <= 0)
            {
                ModelState.AddModelError("SoLuong", "Số lượng phải lớn hơn 0");
            }
            if (sanPham.GiaTien <= 0)
            {
                ModelState.AddModelError("GiaTien", "Giá tiền phải lớn hơn 0");
            }
            if (sanPham.NamSanXuat <= 0 || sanPham.NamSanXuat > 2024)
            {
                ModelState.AddModelError("NamSanXuat", "Năm sản xuất phải lớn hơn 0 và nhỏ hơn 2025");
            }
            if (string.IsNullOrEmpty(sanPham.TenSanPham))
            {
                ModelState.AddModelError("TenSanPham", "Tên sản phẩm không được để trống.");
            }
            // Check if MaSanPham is empty or null
            if (string.IsNullOrEmpty(sanPham.MaSanPham))
            {
                ModelState.AddModelError("MaSanPham", "Mã sản phẩm không được để trống.");
            }
            else
            {
                // Kiểm tra xem mã sản phẩm đã tồn tại chưa
                if (db.SanPhams.Any(p => p.MaSanPham == sanPham.MaSanPham))
                {
                    ModelState.AddModelError("MaSanPham", "Mã sản phẩm đã tồn tại.");
                }
            }
            if (!string.IsNullOrEmpty(sanPham.Anh))
            {
                string fileExtension = Path.GetExtension(sanPham.Anh).ToLower();
                string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                if (!allowedExtensions.Contains(fileExtension))
                {
                    ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                }
            }

            if (ModelState.IsValid)
            {
                db.SanPhams.Add(sanPham);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Sản phẩm mới đã được thêm thành công.";
                return RedirectToAction("Index");
            }

            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", sanPham.MaLoaiSanPham);
            ViewBag.MaMau = new SelectList(db.Maus, "MaMau", "TenMau", sanPham.MaMau);
            ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat", sanPham.MaNhaSanXuat);
            ViewBag.MaXuatXu = new SelectList(db.XuatXus, "MaXuatXu", "TenXuatXu", sanPham.MaXuatXu);
            return View(sanPham);
        }

        // GET: SanPham_TuanKiet/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", sanPham.MaLoaiSanPham);
            ViewBag.MaMau = new SelectList(db.Maus, "MaMau", "TenMau", sanPham.MaMau);
            ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat", sanPham.MaNhaSanXuat);
            ViewBag.MaXuatXu = new SelectList(db.XuatXus, "MaXuatXu", "TenXuatXu", sanPham.MaXuatXu);
            return View(sanPham);
        }

        // POST: SanPham_TuanKiet/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSanPham,TenSanPham,GiaTien,MaLoaiSanPham,MaNhaSanXuat,SoLuong,Anh,GhiChu,KichThuocKhoiLuong,NamSanXuat,MaMau,MaXuatXu,ChatLieu")] SanPham sanPham)
        {
            // Check if MaSanPham is empty
            if (string.IsNullOrEmpty(sanPham.MaSanPham))
            {
                ModelState.AddModelError("MaSanPham", "Mã sản phẩm không được để trống");
            }
            if (sanPham.GiaTien <= 0)
            {
                ModelState.AddModelError("GiaTien", "Giá tiền phải lớn hơn 0");
            }
            if (sanPham.NamSanXuat <= 0 || sanPham.NamSanXuat > 2024)
            {
                ModelState.AddModelError("NamSanXuat", "Năm sản xuất phải lớn hơn 0 và nhỏ hơn 2025");
            }
            if (string.IsNullOrEmpty(sanPham.TenSanPham))
            {
                ModelState.AddModelError("TenSanPham", "Tên sản phẩm không được để trống.");
            }
            // Check if SoLuong is less than or equal to 0
            if (sanPham.SoLuong <= 0)
            {
                ModelState.AddModelError("SoLuong", "Số lượng phải lớn hơn 0");
            }

            // Check if the provided MaSanPham already exists (excluding the current record)
            if (db.SanPhams.Any(x => x.MaSanPham == sanPham.MaSanPham && x.MaSanPham != sanPham.MaSanPham))
            {
                ModelState.AddModelError("MaSanPham", "Mã sản phẩm đã tồn tại");
            }
            if (!string.IsNullOrEmpty(sanPham.Anh))
            {
                string fileExtension = Path.GetExtension(sanPham.Anh).ToLower();
                string[] allowedExtensions = { ".png", ".jpg", ".jpeg" };

                if (!allowedExtensions.Contains(fileExtension))
                {
                    ModelState.AddModelError("Anh", "Chỉ chấp nhận file ảnh có đuôi .png hoặc .jpg hoặc .jpeg");
                }
            }
            if (ModelState.IsValid)
            {
                // Retrieve the existing entity from the database
                var existingEntity = db.SanPhams.Find(sanPham.MaSanPham);
                if (existingEntity == null)
                {
                    return HttpNotFound();
                }

                // Check if Anh is not provided, then use the existing value
                if (string.IsNullOrWhiteSpace(sanPham.Anh))
                {
                    sanPham.Anh = existingEntity.Anh;
                }

                // Update the existing entity with the values from the modified object
                db.Entry(existingEntity).CurrentValues.SetValues(sanPham);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Thông tin sản phẩm đã được cập nhật thành công.";
                return RedirectToAction("Index");
            }

            // Populate dropdown lists for related entities
            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", sanPham.MaLoaiSanPham);
            ViewBag.MaMau = new SelectList(db.Maus, "MaMau", "TenMau", sanPham.MaMau);
            ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat", sanPham.MaNhaSanXuat);
            ViewBag.MaXuatXu = new SelectList(db.XuatXus, "MaXuatXu", "TenXuatXu", sanPham.MaXuatXu);

            return View(sanPham);
        }




        // GET: SanPham_TuanKiet/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: SanPham_TuanKiet/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanPham);
            db.SaveChanges();
            TempData["SuccessMessage"] = "Sản phẩm đã được xóa thành công.";
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

        public ActionResult Search(string searchTerm)
        {
            // Nếu searchTerm không tồn tại hoặc là chuỗi rỗng, hiển thị toàn bộ sản phẩm
            if (string.IsNullOrEmpty(searchTerm))
            {
                return RedirectToAction("Index");
            }

            // Tìm kiếm sản phẩm theo tên
            var searchResults = db.SanPhams.Where(s => s.TenSanPham.Contains(searchTerm)).ToList();

            // Truyền kết quả tìm kiếm vào view Index
            return View("Index", searchResults);
        }



        public ActionResult FilterByManufacturer(string[] nhaSanXuat)
        {
            if (nhaSanXuat != null && nhaSanXuat.Any())
            {
                var sanPhamDuocLoc = db.SanPhams.Where(p => nhaSanXuat.Contains(p.NhaSanXuat.TenNhaSanXuat)).ToList();
                return View("Index", sanPhamDuocLoc);
            }
            else
            {
                // Nếu không có checkbox nào được chọn, hiển thị tất cả sản phẩm
                return RedirectToAction("Index");
            }
        }


    }
}
