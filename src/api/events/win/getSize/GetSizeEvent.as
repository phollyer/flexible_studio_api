package api.events.win.getSize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class GetSizeEvent extends WinEvent
	{
		/**
	* The GetSizeEvent.RESULT constant defines the value of the
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
		
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function GetSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetSizeEvent = new GetSizeEvent( type );
			e.height = height;
			e.width = width;
			return e;
		}
	}
}