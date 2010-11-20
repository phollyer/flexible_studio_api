package api.events.win.setMaskColor
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetMaskColorEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_COLOR:String = "missingColor";
		
		public function SetMaskColorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetMaskColorEvent = new SetMaskColorEvent( type );
			return e;
		}
	}
}