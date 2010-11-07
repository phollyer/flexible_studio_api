package api.events.fileSys
{
	import flash.events.Event;
	import api.events.KernelEvent
	
	public class FileSysEvent extends KernelEvent
	{
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