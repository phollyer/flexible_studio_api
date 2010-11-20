package api.events.wmVideo.getVersion
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class GetVersionEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var version:Number = -1;
		
		public function GetVersionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetVersionEvent = new GetVersionEvent( type );
			e.version = version;
			return e;
		}
	}
}