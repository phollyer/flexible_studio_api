package api.events.win.setStageAlign
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetStageAlignEvent extends WinEvent
	{
		
	/**
	* The SetStageAlignEvent.INVAID_ALIGNMENT constant defines the value of the
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
		public static const INVAID_ALIGNMENT:String = "invalidAlignment";
		
		public function SetStageAlignEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetStageAlignEvent = new SetStageAlignEvent( type );
			return e;
		}
	}
}