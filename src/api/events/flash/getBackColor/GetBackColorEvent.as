package api.events.flash.getBackColor
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class GetBackColorEvent extends FlashEvent
	{
		/**
	* The GetBackColorEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>color</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var color:String = null;
		
		public function GetBackColorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetBackColorEvent = new GetBackColorEvent( type );
			e.color = color;
			return e;
		}
	}
}