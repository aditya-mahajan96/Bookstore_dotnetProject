using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mahajan_BookStore_921.Models
{
    public class Book
    {
        public string ProductID { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public decimal UnitPrice { get; set; }
        public string ImageFile { get; set; }
    }
}