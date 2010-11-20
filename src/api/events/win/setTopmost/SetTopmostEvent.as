package api.events.win.setTopmost
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetTopmostEvent extends WinEvent
	{
		
		public function SetTopmostEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetTopmostEvent = new SetTopmostEvent( type );
			return e;
		}
	}
}