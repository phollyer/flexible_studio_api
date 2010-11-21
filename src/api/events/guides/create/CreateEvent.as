package api.events.guides.create
{
	import flash.events.Event;
	
	import api.events.guides.GuidesEvent;

	public class CreateEvent extends GuidesEvent
	{
		/**
	* The CreateEvent.INVALID_ORIENTATION constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidOrientation</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidOrientation
	*/
		public static const INVALID_ORIENTATION:String = "invalidOrientation";
		
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