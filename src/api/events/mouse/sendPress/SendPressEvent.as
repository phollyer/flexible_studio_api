package api.events.mouse.sendPress
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class SendPressEvent extends MouseEvent
	{
		
	/**
	* The SendPressEvent.INVALID_BUTTON constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidButton</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidButton
	*/
		public static const INVALID_BUTTON:String = "invalidButton";
		
		public function SendPressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendPressEvent = new SendPressEvent( type );
			return e;
		}	
	}
}