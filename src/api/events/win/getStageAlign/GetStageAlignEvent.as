package api.events.win.getStageAlign
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class GetStageAlignEvent extends WinEvent
	{
		/**
	* The GetStageAlignEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>public</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>alignment</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType public
	*/
		public static const RESULT:String = "result";
		
		public var alignment:String = null;
		
		public function GetStageAlignEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetStageAlignEvent = new GetStageAlignEvent( type );
			e.alignment = alignment;
			return e;
		}
	}
}