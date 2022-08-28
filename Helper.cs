﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ElectronicsHub_FrontEnd.ElectronicsHubBackendService;

namespace ElectronicsHub_FrontEnd
{
    public class Helper
    {
        private static BackendServiceClient sr = new BackendServiceClient();

        public static double GetReviewsAverage(List<ProductReview> prodReviews)
        {
            double sum = 0.0;

            foreach (var pR in prodReviews.Where(r => r != null))
            {
                sum += pR.Rating;
            }

            return sum / prodReviews.Count();
        }

        public static double ConvRatingToPercentage(double rating)
        {
            return (rating / 5.0) * 100.0;
        }

        public static double GetCartItemsTotal(List<CartItem> cartItems)
        {
            decimal total = 0;

            foreach (CartItem cartItem in cartItems)
            {
                total += cartItem.Quantity * sr.GetProductById(cartItem.ProductId).Price;
            }

            return (double)total;
        }
    }
}