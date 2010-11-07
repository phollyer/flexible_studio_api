package api.events.http.getLastResponse
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetLastResponseEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var statusCode:String = null;
		public var statusDetails:String = null;
		
		public function GetLastResponseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetLastResponseEvent = new GetLastResponseEvent( type );
			e.statusCode = statusCode;
			e.statusDetails = statusDetails;
			return e;
		}
	}
}