package api.events.script.addCode
{
	import flash.events.Event;
	
	import api.events.script.ScriptEvent;

	public class AddCodeEvent extends ScriptEvent
	{
		
		/**
		* The AddCodeEvent.RESULT constant defines the value of the
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