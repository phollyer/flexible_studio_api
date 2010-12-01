package api.events.sysTools.writeStdOut
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class WriteStdOutEvent extends SysToolsEvent
	{
		
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