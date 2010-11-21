package api.events.win.getPosition
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class GetPositionEvent extends WinEvent
	{
		/**
	* The GetPositionEvent.RESULT constant defines the value of the
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
		
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function GetPositionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetPositionEvent = new GetPositionEvent( type );
			e.x = x;
			e.y = y;
			return e;
		}
	}
}