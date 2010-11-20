package api.events.fileSys.clearAttrs
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class ClearAttrsEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_ATTRS:String = "invalidAttrs";
		public static const MISSING_ATTRS:String = "missingAttrs";
		public static const MISSING_PATH:String = "missingPath";
		
		public function ClearAttrsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearAttrsEvent = new ClearAttrsEvent( type );
			return e;
		}
	}
}