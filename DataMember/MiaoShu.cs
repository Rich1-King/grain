using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataMember
{
   public class MiaoShu
    {
      public static DisplayMessageModel RiceMessage;
      public static DisplayMessageModel CoreMessage;
      public static DisplayMessageModel WheateMessage;

      public MiaoShu()
      {
          getMiaoShu();
      }

       public void getMiaoShu()
       {
           try
           {
               RiceMessage = SqlData.getDisplay(2);
               CoreMessage = SqlData.getDisplay(1);
               WheateMessage = SqlData.getDisplay(3);
           }
           catch (Exception e)
           {
               throw e;
           }
       }



    }
}
