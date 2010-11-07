package api.events.win.setAlpha
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetAlphaEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PERCENT:String = "missingPercent";
		
		public function SetAlphaEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetAlphaEvent = new SetAlphaEvent( type );
			return e;
		}
	}
}