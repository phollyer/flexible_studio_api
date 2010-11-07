package api.events.crypto.encryptString
{
	import flash.events.Event;
	
	import api.events.crypto.CryptoEvent;

	public class EncryptStringEvent extends CryptoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DATA:String = "missingData";
		public static const MISSING_KEY:String = "missingKey";
		public static const RESULT:String = "result";
		
		public var data:String = null;
		
		public function EncryptStringEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EncryptStringEvent = new EncryptStringEvent( type );
			return e;
		}
	}
}