package api.events.win.setMaskColor
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetMaskColorEvent extends WinEvent
	{
		public static const RESULT:String = "result";
		
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