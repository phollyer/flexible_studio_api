package api.events.win.center
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class CenterEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function CenterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CenterEvent = new CenterEvent( type );
			return e;
		}
	}
}