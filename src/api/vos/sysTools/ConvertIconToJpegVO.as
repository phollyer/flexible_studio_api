package api.events.sysTools
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class SysToolsEvent extends KernelEvent
	{
		public function SysToolsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SysToolsEvent = new SysToolsEvent( type );
			return e;
		}
	}
}