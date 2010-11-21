package api.events.script.create
{
	import flash.events.Event;
	
	import api.events.script.ScriptEvent;

	public class CreateEvent extends ScriptEvent
	{
		
		/**
		* The CreateEvent.INVALID_LANGUAGE constant defines the value of the
		* <code>type</code> property of the event object
		* for a <code>invalidLanguage</code> event.
		*
		* <p>The properties of the event object have the following values:</p>
		* <table class=innertable>
		* <tr><th>Property</th><th>Value</th></tr>
		* 
		* </table>
		*
		* @eventType invalidLanguage
		*/
		public static const INVALID_LANGUAGE:String = "invalidLanguage";
		
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