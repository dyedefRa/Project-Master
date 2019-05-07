using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;

namespace ApiyeBaglanma._MyContent
{
    public class ApiHelper
    {
        public static HttpClient httpClient { get; set; }
        public static void InitialClient()
        {
            httpClient = new HttpClient();
            httpClient.BaseAddress = new Uri("https://xkcd.com/");
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
        }
    }
}