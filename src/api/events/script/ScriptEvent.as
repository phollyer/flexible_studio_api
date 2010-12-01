package api.events.script
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class ScriptEvent extends SWFStudioEvent
	{
		public function ScriptEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ScriptEvent = new ScriptEvent( type );
			return e;
		}
	}
}