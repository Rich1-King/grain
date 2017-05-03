using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
namespace CloudChart3D
{
    class ConfigHelper
    {
        public  static string GetConfig(string key)
        {
            
            XmlDocument doc = new XmlDocument();
            doc.Load("Config.xml");
            XmlReader reader = new XmlNodeReader(doc);
            XmlNode node = doc.SelectSingleNode("config");
            foreach (XmlNode n in node)
            {
                XmlElement element = n as XmlElement;
                if (element.GetAttribute("key") == key)
                {
                    return element.GetAttribute("value");
                }
            }  
            return null;
        }
      
    }
}
