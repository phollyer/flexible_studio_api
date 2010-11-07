package api.events.http.getContentLength
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetContentLengthEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var totalBytes:Number = -1;
		
		public function GetContentLengthEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e : GetContentLengthEvent = new GetContentLengthEvent(type);
			e.totalBytes = totalBytes;
			return e;
		}
	}
}