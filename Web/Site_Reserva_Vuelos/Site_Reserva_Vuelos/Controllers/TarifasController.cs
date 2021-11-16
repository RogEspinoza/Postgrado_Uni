using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAL;

namespace Site_Reserva_Vuelos.Controllers
{
    public class TarifasController : Controller
    {
        TblTarifa tarifa = new TblTarifa();
        // GET: Tarifas
        public ActionResult Tarifa()
        {
            return View();
        }

        // GET: Tarifas/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        public ActionResult ObtenerTarifas()
        {
            return View(tarifa.ObtenerListaTarifas());
        }

        // GET: Tarifas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Tarifas/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Tarifas/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Tarifas/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Tarifas/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Tarifas/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
