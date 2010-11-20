package api.events.wmAudio.getVersion
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class GetVersionEvent extends WmAudioEvent
	{
		
	/**
	* The GetVersionEvent.RESULT constant defines the value of the
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
		
		public var version:Number = -1;
		
		public function GetVersionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetVersionEvent = new GetVersionEvent( type );
			e.version = version;
			return e;
		}
	}
}