package api.events.security.setExpiryDate
{
	import flash.events.Event;
	
	import api.events.security.SecurityEvent;

	public class SetExpiryDateEvent extends SecurityEvent
	{
		/**
	* The SetExpiryDateEvent.INVALID_DATE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidDate</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidDate
	*/
		public static const INVALID_DATE:String = "invalidDate";
		
		public function SetExpiryDateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetExpiryDateEvent = new SetExpiryDateEvent( type );
			return e;
		}
	}
}