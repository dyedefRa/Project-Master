using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;

namespace ApiyeBaglanma._MyContent
{
    public class RestClient2
    {//https://nettrainment.bsh-group.com/api/v1/auth?id=9nU2W01dJK
         static  async Task RunAsync()
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://nettrainment.bsh-group.com/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                HttpResponseMessage httpResponse = await client.GetAsync("api/v1/auth?id=9nU2W01dJK");
                if (httpResponse.IsSuccessStatusCode)
                {
                    //Item data=await httpResponse.Content.ReadAsStreamAsync()
                }
           
                    
                    }

        }
    }

}