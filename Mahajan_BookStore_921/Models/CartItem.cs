using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mahajan_BookStore_921.Models
{
    public class CartItem
    {
        public CartItem() { }

        public CartItem(Book product, int quantity)
        {
            this.bookValue = product;
            this.Quantity = quantity;
        }

        public Book bookValue { get; set; }
        public int Quantity { get; set; }

        public void AddQuantity(int quantity)
        {
            this.Quantity += quantity;
        }

        public string Display()
        {
            string displayString = string.Format("{0} ({1} at {2})",
                bookValue.Name,
                Quantity.ToString(),
                bookValue.UnitPrice.ToString("c")
            );
            return displayString;
        }
    }

}