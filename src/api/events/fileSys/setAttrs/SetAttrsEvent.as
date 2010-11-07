package api.events.fileSys.setAttrs
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class SetAttrsEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ATTRS:String = "missingAttrs";
		public static const MISSING_PATH:String = "missingPath";
		
		public function SetAttrsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetAttrsEvent = new SetAttrsEvent( type );
			return e;
		}
	}
}