//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace Framework.Entities //add
{
    public partial class Post
    {
        public Post()
        {
            this.Tags = new HashSet<Tags>();
            this.Comment = new HashSet<Comment>();
        }
    
        public int PostID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public System.DateTime PublishedDate { get; set; }
        public int Auther { get; set; }
        public int Category { get; set; }
    
        public virtual Users User { get; set; }
        public virtual Categories Categories { get; set; }
        public virtual ICollection<Tags> Tags { get; set; }
        public virtual ICollection<Comment> Comment { get; set; }
    }
    
}