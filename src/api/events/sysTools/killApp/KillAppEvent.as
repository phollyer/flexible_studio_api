package api.events.sysTools.killApp
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class KillAppEvent extends SysToolsEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_APPLICAION:String = "missingApplication";
		
		public function KillAppEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : KillAppEvent = new KillAppEvent( type );
			return e;
		}
	}
}