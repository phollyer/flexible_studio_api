package api.events.mouse.notifiers
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class OnMouseMoveEvent extends MouseEvent
	{
		/**
	* The OnMouseMoveEvent.CHANGE constant defines the value of the
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
	* The OnMouseMoveEvent.RESULT constant defines the value of the
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
		
		public var sx:Number = -1;
		public var sy:Number = -1;
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function OnMouseMoveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnMouseMoveEvent = new OnMouseMoveEvent( type );
			e.sx = sx;
			e.sy = sy;
			e.x = x;
			e.y = y;
			return e;
		}
	}
}