package api.events.http.getBuffer
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetBufferEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var bufferContent:String = null;
		
		public function GetBufferEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetBufferEvent = new GetBufferEvent(type);
			e.bufferContent = bufferContent;
			return e;
		}
	}
}