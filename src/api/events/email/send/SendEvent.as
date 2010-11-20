package api.events.email.send
{
	import flash.events.Event;
	
	import api.events.email.EmailEvent;

	public class SendEvent extends EmailEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_TO_ADDRESS:String = "missingToAddress";
		public static const RESULT:String = "result";
		
		public var serverResponse:String = null;
		
		public function SendEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendEvent = new SendEvent( type );
			e.serverResponse = serverResponse;
			return e;
		}
	}
}