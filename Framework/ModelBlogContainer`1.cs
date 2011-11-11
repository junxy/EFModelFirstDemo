using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation; //add
using System.Linq;
using Framework.Entities;
using System.Text;
using System.Data.Objects;

namespace Framework
{
    public partial class ModelBlogContainer : DbContext
    {
        public override int SaveChanges()
        {
            IEnumerable<DbEntityValidationResult> validationErrors = GetValidationErrors();
            if (validationErrors != null)
            {
                foreach (var validationError in validationErrors)
                {
                    if (validationError != null && validationError.ValidationErrors.Count > 0)
                    {
                        StringBuilder sbErrors = new StringBuilder();
                        foreach (var validationError2 in validationError.ValidationErrors)
                        {
                            sbErrors.AppendLine(validationError2.ErrorMessage);
                        }
                        throw new Exception(sbErrors.ToString());
                    }
                }
            }

            return base.SaveChanges();
        }

        public ObjectContext UnderlyingContext
        {
            get { return ((IObjectContextAdapter)this).ObjectContext; }
        }

    }
}
