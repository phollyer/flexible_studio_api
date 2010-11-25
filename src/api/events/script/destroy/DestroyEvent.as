package api.events.script.destroy
{
	import flash.events.Event;
	
	import api.events.script.ScriptEvent;

	public class DestroyEvent extends ScriptEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_MODULE:String = "missingModule";
		
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