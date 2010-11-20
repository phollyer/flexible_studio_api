package api.events.crypto.encryptFile
{
	import flash.events.Event;
	
	import api.events.crypto.CryptoEvent;

	public class EncryptFileEvent extends CryptoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DESTINATION:String = "missingDestination";
		public static const MISSING_KEY:String = "missingKey";
		public static const MISSING_SOURCE:String = "missingSource";
		
		public function EncryptFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EncryptFileEvent = new EncryptFileEvent( type );
			return e;
		}
	}
}