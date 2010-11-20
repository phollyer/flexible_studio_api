package api.events.win.setBackColor
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetBackColorEvent extends WinEvent
	{
		
		public function SetBackColorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetBackColorEvent = new SetBackColorEvent( type );
			return e;
		}
	}
}