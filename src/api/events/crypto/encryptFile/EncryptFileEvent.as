package api.events.crypto.encryptFile
{
	import flash.events.Event;
	
	import api.events.crypto.CryptoEvent;

	public class EncryptFileEvent extends CryptoEvent
	{
		
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