package api.events.transparent.isMaskedMode
{
	import flash.events.Event;
	
	import api.events.transparent.TransparentEvent;

	public class IsMaskedModeEvent extends TransparentEvent
	{
		
	/**
	* The IsMaskedModeEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>isMasked</td><td>false</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var isMasked:Boolean = false;
		
		public function IsMaskedModeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IsMaskedModeEvent = new IsMaskedModeEvent( type );
			e.isMasked = isMasked;
			return e;
		}
	}
}