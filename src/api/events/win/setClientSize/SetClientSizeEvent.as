package api.events.win.setClientSize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetClientSizeEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HEIGHT:String = "missingHeight";
		public static const MISSING_WIDTH:String = "missingWidth";
		
		public function SetClientSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetClientSizeEvent = new SetClientSizeEvent( type );
			return e;
		}
	}
}