package api.events.win.notifiers
{
	import flash.events.Event;

	public class OnMoveEvent extends Event
	{
		/**
	* The OnMoveEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>public</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType public
	*/
		public static const RESULT:String = "result";
		/**
	* The OnMoveEvent.STATUS constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>public</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType public
	*/
		public static const STATUS:String = "status";
		
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function OnMoveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnMoveEvent = new OnMoveEvent( type );
			e.x = x;
			e.y = y;
			return e;
		}
	}
}