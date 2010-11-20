package api.events.script.loadCode
{
	import flash.events.Event;
	
	import api.events.script.ScriptEvent;

	public class LoadCodeEvent extends ScriptEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_MODULE:String = "missingModule";
		public static const RESULT:String = "result";
		
		public var scriptError:String = null;
		
		public function LoadCodeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadCodeEvent = new LoadCodeEvent( type );
			e.scriptError = scriptError;
			return e;
		}
	}
}