package api.events.joystick.notifiers
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class OnJoyComboEvent extends JoystickEvent
	{
		
	/**
	* The OnJoyComboEvent.CHANGE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>change</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>id</td><td>null</td></tr>
	* 
	* <tr><td>mask</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType change
	*/
		public static const CHANGE:String = "change";
		
	/**
	* The OnJoyComboEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>id</td><td>null</td></tr>
	* 
	* <tr><td>mask</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var id:String = null;
		public var mask:String = null;
		
		public function OnJoyComboEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnJoyComboEvent = new OnJoyComboEvent( type );
			return e;
		}
	}
}