package api.events.sysTools.writeStdOut
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class WriteStdOutEvent extends SysToolsEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DATA:String = "missingData";
		
		public function WriteStdOutEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteStdOutEvent = new WriteStdOutEvent( type );
			return e;
		}
	}
}