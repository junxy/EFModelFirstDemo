using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Framework;
using Framework.Entities;

namespace MvcApplication.Admin.Controllers
{
    public class UsersController : BaseController
    {

        ModelBlogContainer db = new ModelBlogContainer();

        //
        // GET: /Users/

        public ActionResult Index()
        {
            var users = db.Users.ToList();
            return View(users);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Users user)
        {
            if (ModelState.IsValid)
            {
                user.UserExtras = new UserExtra()
                {
                    LastIP = "0.0.0.0",
                    LsatDate = new DateTime(2011, 1, 1)
                };

                db.Users.Add(user);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            else
            {
                return View(user);
            }
        }

    }
}
