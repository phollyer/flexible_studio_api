package api.events.script.loadCode
{
	import flash.events.Event;
	
	import api.events.script.ScriptEvent;

	public class LoadCodeEvent extends ScriptEvent
	{
		
		/**
		* The LoadCodeEvent.RESULT constant defines the value of the
		* <code>type</code> property of the event object
		* for a <code>result</code> event.
		*
		* <p>The properties of the event object have the following values:</p>
		* <table class=innertable>
		* <tr><th>Property</th><th>Value</th></tr>
		* 
		* <tr><td>scriptError</td><td>null</td></tr>
		* 
		* </table>
		*
		* @eventType result
		*/
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