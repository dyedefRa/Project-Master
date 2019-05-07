using ApiyeBaglanma._MyContent;
using ApiyeBaglanma.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace ApiyeBaglanma.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            RestClient restClient = new RestClient();
            restClient.endPoint = "";
            string strResponse = restClient.makaRequest();

            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {

            ViewBag.Message = "Your contact page.";

            return View();
        }
        private int maxNumber = 0;
        private int currentNumber = 0;
        private async Task LoadImage(int imageNumber=0)
        {
            var comic = await ComicProcessor.LoadComic(imageNumber);
            if (imageNumber==0)
            {
                maxNumber = comic.Num;
            }
            currentNumber = comic.Num;
            var uriSourve = new Uri(comic.Img, UriKind.Absolute);
        
                }
    }
}