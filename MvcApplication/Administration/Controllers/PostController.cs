using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Framework;
using Framework.Entities;

namespace MvcApplication.Admin.Controllers
{
    public class PostController : BaseController
    {

        ModelBlogContainer db = new ModelBlogContainer();

        //
        // GET: /Post/

        public ActionResult Index()
        {
            var posts = db.Posts.ToList();
            return View(posts);
        }

        public ActionResult Create()
        {
            return View(new Post()
            {
                PublishedDate = DateTime.Now
            });
        }

        [HttpPost]
        public ActionResult Create(Post post)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Posts.Add(post);
                    db.SaveChanges();
                }
                catch (Exception)
                {

                    throw;
                }
                return RedirectToAction("Index");
            }
            else
            {
                return View(post);
            }
        }

    }
}
