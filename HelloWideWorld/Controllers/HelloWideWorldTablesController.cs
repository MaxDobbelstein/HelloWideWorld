using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Dotzilla.Infrastructure.Caching.Implementations;
using HelloWideWorld.Models;

namespace HelloWideWorld.Controllers
{
    public class HelloWideWorldTablesController : Controller
    {
        private HelloWideWorldEntities1 db = new HelloWideWorldEntities1();
        RedisCache cache = new RedisCache();

        // GET: HelloWideWorldTables
        public ActionResult Index()
        {
            return View(db.HelloWideWorldTable.ToList());
        }

        // GET: HelloWideWorldTables/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HelloWideWorldTable helloWideWorldTable = db.HelloWideWorldTable.Find(id);
            if (helloWideWorldTable == null)
            {
                return HttpNotFound();
            }
            return View(helloWideWorldTable);
        }

        // GET: HelloWideWorldTables/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: HelloWideWorldTables/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Text")] HelloWideWorldTable helloWideWorldTable)
        {
            cache.Add(helloWideWorldTable.id.ToString(), helloWideWorldTable.Text);
            if (ModelState.IsValid)
            {               
                db.HelloWideWorldTable.Add(helloWideWorldTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(helloWideWorldTable);
        }

        // GET: HelloWideWorldTables/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HelloWideWorldTable helloWideWorldTable = db.HelloWideWorldTable.Find(id);
            if (helloWideWorldTable == null)
            {
                return HttpNotFound();
            }
            return View(helloWideWorldTable);
        }

        // POST: HelloWideWorldTables/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Text")] HelloWideWorldTable helloWideWorldTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(helloWideWorldTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(helloWideWorldTable);
        }

        // GET: HelloWideWorldTables/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HelloWideWorldTable helloWideWorldTable = db.HelloWideWorldTable.Find(id);
            if (helloWideWorldTable == null)
            {
                return HttpNotFound();
            }
            return View(helloWideWorldTable);
        }

        // POST: HelloWideWorldTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            HelloWideWorldTable helloWideWorldTable = db.HelloWideWorldTable.Find(id);
            db.HelloWideWorldTable.Remove(helloWideWorldTable);
            db.SaveChanges();
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
