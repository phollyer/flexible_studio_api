package api.events.crypto.decryptFile
{
	import flash.events.Event;
	
	import api.events.crypto.CryptoEvent;

	public class DecryptFileEvent extends CryptoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DESTINATION:String = "missingDestination";
		public static const MISSING_KEY:String = "missingKey";
		public static const MISSING_SOURCE:String = "missingSource";
		
		public function DecryptFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DecryptFileEvent = new DecryptFileEvent( type );
			return e;
		}
	}
}