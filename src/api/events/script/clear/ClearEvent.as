package api.events.script.clear
{
	import flash.events.Event;
	
	import api.events.script.ScriptEvent;

	public class ClearEvent extends ScriptEvent
	{
		
		public function ClearEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearEvent = new ClearEvent( type );
			return e;
		}
	}
}