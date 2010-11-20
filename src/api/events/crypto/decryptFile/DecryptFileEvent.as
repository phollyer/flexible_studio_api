package api.events.crypto.decryptFile
{
	import flash.events.Event;
	
	import api.events.crypto.CryptoEvent;

	public class DecryptFileEvent extends CryptoEvent
	{
		
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