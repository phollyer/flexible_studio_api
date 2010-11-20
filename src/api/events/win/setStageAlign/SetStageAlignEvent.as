package api.events.win.setStageAlign
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetStageAlignEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVAID_ALIGNMENT:String = "invalidAlignment";
		public static const MISSING_ALIGNMENT:String = "missingAlignment";
		
		public function SetStageAlignEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetStageAlignEvent = new SetStageAlignEvent( type );
			return e;
		}
	}
}