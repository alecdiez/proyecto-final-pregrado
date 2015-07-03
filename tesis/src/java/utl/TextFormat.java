/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utl;

public final class TextFormat
{

   public static String toStringNeverNull(Object o)
   {
      return o == null ? "" : o.toString();
   }

}
