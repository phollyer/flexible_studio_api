package api.events.sysTools.lockWorkStation
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class LockWorkStationEvent extends SysToolsEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function LockWorkStationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LockWorkStationEvent = new LockWorkStationEvent( type );
			return e;
		}	
	}
}