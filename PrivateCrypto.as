package
{
   public class PrivateCrypto
   {
      private static const KEY:String = "b8f3e1a9c4d7f2b6e8a1c5d9f3b7e2a4";

      public function PrivateCrypto()
      {
         super();
      }

      public static function encrypt(text:String):String
      {
         if (!text || text.length == 0)
         {
            return "";
         }

         var result:String = "";
         var keyLen:int = KEY.length;
         var keyIndex:int = 0;

         for (var i:int = 0; i < text.length; i++)
         {
            var c:int = text.charCodeAt(i);
            var k:int = KEY.charCodeAt(keyIndex % keyLen);
            var e:int = c ^ k;

            var hex:String = e.toString(16);
            if (hex.length < 2) hex = "0" + hex;

            result += hex;
            keyIndex++;
         }

         return result;
      }

      public static function decrypt(hex:String):String
      {
         if (!hex || hex.length == 0)
         {
            return "";
         }

         var result:String = "";
         var keyLen:int = KEY.length;
         var keyIndex:int = 0;

         for (var i:int = 0; i < hex.length; i += 2)
         {
            var hexPair:String = hex.substr(i, 2);
            var e:int = parseInt(hexPair, 16);
            var k:int = KEY.charCodeAt(keyIndex % keyLen);
            var c:int = e ^ k;

            result += String.fromCharCode(c);
            keyIndex++;
         }

         return result;
      }
   }
}
