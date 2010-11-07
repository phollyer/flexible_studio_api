package api.events.win.getStageAlign
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class GetStageAlignEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var alignment:String = null;
		
		public function GetStageAlignEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetStageAlignEvent = new GetStageAlignEvent( type );
			e.alignment = alignment;
			return e;
		}
	}
}