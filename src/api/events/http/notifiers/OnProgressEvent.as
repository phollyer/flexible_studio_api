package api.events.http.notifiers
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class OnProgressEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var bytesTransferred:Number = -1;
		
		public function OnProgressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnProgressEvent = new OnProgressEvent(type);
			e.bytesTransferred = bytesTransferred;
			return e;
		}
	}
}