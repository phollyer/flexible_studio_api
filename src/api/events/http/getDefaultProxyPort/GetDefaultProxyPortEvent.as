package api.events.http.getDefaultProxyPort
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetDefaultProxyPortEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var portNumber:Number = -1;
		
		public function GetDefaultProxyPortEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDefaultProxyPortEvent = new GetDefaultProxyPortEvent( type );
			e.portNumber = portNumber;
			return e;
		}
	}
}