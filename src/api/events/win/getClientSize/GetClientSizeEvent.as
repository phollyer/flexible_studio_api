package api.events.win.getClientSize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class GetClientSizeEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function GetClientSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetClientSizeEvent = new GetClientSizeEvent( type );
			e.height = height;
			e.width = width;
			return e;
		}
	}
}