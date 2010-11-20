package api.events.sysInfo
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class SysInfoEvent extends KernelEvent
	{
		public function SysInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SysInfoEvent = new SysInfoEvent( type );
			return e;
		}
	}
}