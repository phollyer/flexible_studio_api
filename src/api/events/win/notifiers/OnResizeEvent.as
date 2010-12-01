package api.events.win.notifiers
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class OnResizeEvent extends WinEvent
	{
		
	/**
	* The OnResizeEvent.RESULT constant defines the value of the
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
	* The OnResizeEvent.STATUS constant defines the value of the
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
		
		public var clientHeight:Number = -1;
		public var clientWidth:Number = -1;
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function OnResizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnResizeEvent = new OnResizeEvent( type );
			e.clientHeight = clientHeight;
			e.clientWidth = clientWidth;
			e.height = height;
			e.width = width;
			return e;
		}
	}
}