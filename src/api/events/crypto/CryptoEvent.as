package api.events.crypto
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class CryptoEvent extends SWFStudioEvent
	{
		public function CryptoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CryptoEvent = new CryptoEvent( type );
			return e;
		}
	}
}