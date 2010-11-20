package api.events.sysInfo.setStickyKeys
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class SetStickyKeysEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetStickyKeysEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetStickyKeysEvent = new SetStickyKeysEvent( type );
			return e;
		}
	}
}