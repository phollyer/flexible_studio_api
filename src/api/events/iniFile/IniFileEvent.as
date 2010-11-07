package api.events.iniFile
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class IniFileEvent extends KernelEvent
	{
		public function IniFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IniFileEvent = new IniFileEvent( type );
			return e;
		}
	}
}