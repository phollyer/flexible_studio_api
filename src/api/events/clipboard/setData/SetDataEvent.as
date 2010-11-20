package api.events.clipboard.setData
{
	import flash.events.Event;
	
	import api.events.clipboard.ClipboardEvent;

	public class SetDataEvent extends ClipboardEvent
	{
		public static const COMPLETE:String = "complete"
		public static const MISSING_DATA:String = "missingData";
		
		public function SetDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetDataEvent = new SetDataEvent( type );
			return e;
		}
	}
}