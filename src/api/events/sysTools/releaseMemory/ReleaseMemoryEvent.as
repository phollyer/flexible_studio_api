package api.events.sysTools.releaseMemory
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class ReleaseMemoryEvent extends SysToolsEvent
	{
		
		public function ReleaseMemoryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ReleaseMemoryEvent = new ReleaseMemoryEvent( type );
			return e;
		}
	}
}