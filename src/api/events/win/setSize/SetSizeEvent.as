package api.events.win.setSize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetSizeEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HEIGHT:String = "missingHeight";
		public static const MISSING_WIDTH:String = "missingWidth";
		
		public function SetSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSizeEvent = new SetSizeEvent( type );
			return e;
		}
	}
}