package api.events.win
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class WinEvent extends SWFStudioEvent
	{
		
	/**
	* The WinEvent.STATE_CHANGED constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>public</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>state</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType public
	*/
		public static const STATE_CHANGED:String = null;
		
		public var state:String = null;
		
		public function WinEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WinEvent = new WinEvent(type);
			e.state = state;
			return e;
		}
	}
}