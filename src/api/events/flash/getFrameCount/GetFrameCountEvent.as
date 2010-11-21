package api.events.flash.getFrameCount
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class GetFrameCountEvent extends FlashEvent
	{
		/**
	* The GetFrameCountEvent.RESULT constant defines the value of the
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
		
		public var totalFrames:Number = -1;
		
		public function GetFrameCountEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFrameCountEvent = new GetFrameCountEvent( type );
			e.totalFrames = totalFrames;
			return e;
		}
	}
}