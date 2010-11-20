package api.events.mouse.notifiers
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class OnMouseButtonEvent extends MouseEvent
	{
		/**
	* The OnMouseButtonEvent.CHANGE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>change</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>button</td><td>null</td></tr>
	* 
	* <tr><td>state</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType change
	*/
		public static const CHANGE:String = "change";
		/**
	* The OnMouseButtonEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>button</td><td>null</td></tr>
	* 
	* <tr><td>state</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";

		public var button:String = null;
		public var state:String = null;
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function OnMouseButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnMouseButtonEvent = new OnMouseButtonEvent( type );
			e.button = button;
			e.state = state;
			e.x = x;
			e.y = y;
			return e;
		}
	}
}