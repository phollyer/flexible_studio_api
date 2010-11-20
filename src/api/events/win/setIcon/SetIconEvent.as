package api.events.win.setIcon
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetIconEvent extends WinEvent
	{
		
		public function SetIconEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetIconEvent = new SetIconEvent( type );
			return e;
		}
	}
}