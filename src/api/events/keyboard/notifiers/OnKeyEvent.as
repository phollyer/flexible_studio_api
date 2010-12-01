package api.events.keyboard.notifiers
{
	import flash.events.Event;
	
	import api.events.keyboard.KeyboardEvent;

	public class OnKeyEvent extends KeyboardEvent
	{
		
	/**
	* The OnKeyEvent.CHANGE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>change</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType change
	*/
		public static const CHANGE:String = "change";
		
	/**
	* The OnKeyEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";

		public var alt:Boolean = false;
		public var blocked:Boolean = false;
		public var ctrl:Boolean = false;
		public var keycode:String = null;
		public var shift:Boolean = false;
		public var state:Boolean = false;
		

		public function OnKeyEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnKeyEvent = new OnKeyEvent( type );
			e.alt = alt;
			e.blocked = blocked;
			e.ctrl = ctrl;
			e.keycode = keycode;
			e.shift = shift;
			e.state = state;
			return e;
		}
	}
}