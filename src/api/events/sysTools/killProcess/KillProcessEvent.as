package api.events.sysTools.killProcess
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class KillProcessEvent extends SysToolsEvent
	{
		
		public function KillProcessEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : KillProcessEvent = new KillProcessEvent( type );
			return e;
		}
	}
}