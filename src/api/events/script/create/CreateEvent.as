package api.events.script.create
{
	import flash.events.Event;
	
	import api.events.script.ScriptEvent;

	public class CreateEvent extends ScriptEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_LANGUAGE:String = "invalidLanguage";
		public static const MISSING_MODULE:String = "missingModule";
		public static const MISSING_LANGUAGE:String = "missingLanguage";
		
		public function CreateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CreateEvent = new CreateEvent( type );
			return e;
		}
	}
}