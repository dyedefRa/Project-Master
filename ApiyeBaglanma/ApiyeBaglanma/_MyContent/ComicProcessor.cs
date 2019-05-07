using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace ApiyeBaglanma._MyContent
{
    public  class ComicProcessor
    {//cıkarabılırısn
        public int MaxComicNumber { get; set; }
        public static async Task<ComicModel> LoadComic(int comicNumber=0)
        {
            string url = "";
            if (comicNumber>0)
            {
                url = $"https://xkcd.com/{ comicNumber }/info.0.json";
            }
            using (HttpResponseMessage response = await ApiHelper.httpClient.GetAsync(url))
            {
                if (response.IsSuccessStatusCode)
                {
                    ComicModel comic = await response.Content.ReadAsAsync<ComicModel>();

                    //cıkar
                    if (comicNumber==0)
                    {
                        MaxComicNumber = comic.Num;
                    }
                    return comic;
                }
                else
                {
                    throw new Exception(response.ReasonPhrase);
                }
            }
        }
    }
}