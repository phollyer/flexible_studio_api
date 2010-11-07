package api.events.fileSys.getAttrs
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class GetAttrsEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var attrs:String = null;
		
		public function GetAttrsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetAttrsEvent = new GetAttrsEvent( type );
			e.attrs = attrs;
			return e;
		}
	}
}