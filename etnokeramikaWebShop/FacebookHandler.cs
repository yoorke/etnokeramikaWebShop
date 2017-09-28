using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Configuration;

namespace etnokeramikaWebShop
{
    public class FacebookHandler
    {
        public List<HtmlMeta> CreateFacebookTags(string title, string type, string url, string image, string siteName, string description, string canonical)
        {
            List<HtmlMeta> tags = new List<HtmlMeta>();

            tags.Add(createTag("fb:admins", ConfigurationManager.AppSettings["facebookAdmins"]));
            tags.Add(createTag("og:title", title));
            tags.Add(createTag("og:type", type));
            tags.Add(createTag("og:url", url));
            tags.Add(createTag("og:image", image));
            tags.Add(createTag("og:site_name", siteName));
            tags.Add(createTag("og:description", description));

            return tags;
        }

        private HtmlMeta createTag(string property, string content)
        {
            HtmlMeta tag = new HtmlMeta();
            tag.Attributes.Add("property", property);
            tag.Attributes.Add("content", content);
            return tag;
        }
    }
}