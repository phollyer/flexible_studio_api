package api.events.win.notifiers
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class OnFocusChangeEvent extends WinEvent
	{
		/**
	* The OnFocusChangeEvent.CHANGE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>public</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>data</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType public
	*/
		public static const CHANGE:String = "change";
		/**
	* The OnFocusChangeEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>public</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>data</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType public
	*/
		public static const RESULT:String = "result";
		
		public var data:String = null;
		
		public function OnFocusChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnFocusChangeEvent = new OnFocusChangeEvent( type );
			e.data = data;
			return e;
		}
	}
}