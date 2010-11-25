package api.events.mouse.notifiers
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class OnMouseWheelEvent extends MouseEvent
	{
		
	/**
	* The OnMouseWheelEvent.CHANGE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>change</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>keymask</td><td>null</td></tr>
	* 
	* <tr><td>scroll</td><td>0</td></tr>
	* 
	* </table>
	*
	* @eventType change
	*/
		public static const CHANGE:String = "change";
		
	/**
	* The OnMouseWheelEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>keymask</td><td>null</td></tr>
	* 
	* <tr><td>scroll</td><td>0</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var keymask:String = null;
		public var scroll:Number = 0;
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function OnMouseWheelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnMouseWheelEvent = new OnMouseWheelEvent( type );
			e.keymask = keymask;
			e.scroll = scroll;
			e.x = x;
			e.y = y;
			return e;
		}
	}
}