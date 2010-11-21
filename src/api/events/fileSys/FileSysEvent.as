package api.events.fileSys
{
	import flash.events.Event;
	import api.events.SWFStudioEvent
	
	public class FileSysEvent extends SWFStudioEvent
	{
		/**
	* The FileSysEvent.ALL_STOPPED constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>allStopped</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType allStopped
	*/
		public static const ALL_STOPPED:String = "allStopped";
		
		public function FileSysEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e : FileSysEvent = new FileSysEvent(type);
			return e;
		}
	}
}