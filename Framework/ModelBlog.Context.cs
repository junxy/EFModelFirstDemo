﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Framework.Entities; //add


namespace Framework
{
    public partial class ModelBlogContainer : DbContext
    {
        public ModelBlogContainer()
            : base("name=ModelBlogContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Users> Users { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<Categories> Categories { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Tags> Tags { get; set; }
        public DbSet<UserExtra> UserExtras { get; set; }
    }
}