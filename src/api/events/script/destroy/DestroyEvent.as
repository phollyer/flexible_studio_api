package api.events.script.destroy
{
	import flash.events.Event;
	
	import api.events.script.ScriptEvent;

	public class DestroyEvent extends ScriptEvent
	{
		
		public function DestroyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DestroyEvent = new DestroyEvent( type );
			return e;
		}
	}
}