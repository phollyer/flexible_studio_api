package api.events.wmAudio.notifiers
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class OnCompleteEvent extends WmAudioEvent
	{
		/**
	* The OnCompleteEvent.RESULT constant defines the value of the
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
		
		public function OnCompleteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnCompleteEvent = new OnCompleteEvent( type );
			return e;
		}
	}
}