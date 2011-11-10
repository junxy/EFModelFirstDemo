using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace Framework.MVC
{
    public class MyRazorViewEngine : RazorViewEngine
    {
        public MyRazorViewEngine()
            : this(null)
        {
        }

        public MyRazorViewEngine(IViewPageActivator viewPageActivator)
            : base(viewPageActivator)
        {
            AreaViewLocationFormats = new[] {
                "~/Administration/Views/{1}/{0}.cshtml",
                "~/Administration/Views/Shared/{0}.cshtml",
            };
            AreaMasterLocationFormats = new[] {
                "~/Administration/Views/{1}/{0}.cshtml",
                "~/Administration/Views/Shared/{0}.cshtml",
            };
            AreaPartialViewLocationFormats = new[] {
                "~/Administration/Views/{1}/{0}.cshtml",
                "~/Administration/Views/Shared/{0}.cshtml",
            };

            ViewLocationFormats = new[] {
                "~/Views/{1}/{0}.cshtml",
                //"~/Views/{1}/{0}.vbhtml",
                "~/Views/Shared/{0}.cshtml",
                //"~/Views/Shared/{0}.vbhtml"
            };
            MasterLocationFormats = new[] {
                "~/Views/{1}/{0}.cshtml",
                //"~/Views/{1}/{0}.vbhtml",
                "~/Views/Shared/{0}.cshtml",
                //"~/Views/Shared/{0}.vbhtml"
            };
            PartialViewLocationFormats = new[] {
                "~/Views/{1}/{0}.cshtml",
                //"~/Views/{1}/{0}.vbhtml",
                "~/Views/Shared/{0}.cshtml",
                //"~/Views/Shared/{0}.vbhtml"
            };

            FileExtensions = new[] {
                "cshtml",
                //"vbhtml",
            };
        }

    }
}
