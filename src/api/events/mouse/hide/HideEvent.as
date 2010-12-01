package api.events.mouse.hide
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class HideEvent extends MouseEvent
	{
		/**
	* The HideEvent.RESULT constant defines the value of the
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
		
		public var displayCounter:Number = -1;
		
		public function HideEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : HideEvent = new HideEvent( type );
			e.displayCounter = displayCounter;
			return e;
		}
	}
}