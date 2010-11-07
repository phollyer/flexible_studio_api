package api.events.http.getHeaders
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetHeadersEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var headers:Array = null;
		
		public function GetHeadersEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetHeadersEvent = new GetHeadersEvent( type );
			e.headers = headers;
			return e;
		}
	}
}