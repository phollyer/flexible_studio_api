package api.events.wmAudio.setVersion
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class SetVersionEvent extends WmAudioEvent
	{
		
	/**
	* The SetVersionEvent.INVALID_VERSION constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidVersion</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidVersion
	*/
		public static const INVALID_VERSION:String = "invalidVersion";
		
		public function SetVersionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetVersionEvent = new SetVersionEvent( type );
			return e;
		}
	}
}