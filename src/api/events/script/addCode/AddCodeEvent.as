package api.events.script.addCode
{
	import flash.events.Event;
	
	import api.events.script.ScriptEvent;

	public class AddCodeEvent extends ScriptEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_MODULE:String = "missingModule";
		public static const RESULT:String = "result";
		
		public var scriptError:String = null;
		
		public function AddCodeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AddCodeEvent = new AddCodeEvent( type );
			e.scriptError = scriptError;
			return e;
		}
	}
}