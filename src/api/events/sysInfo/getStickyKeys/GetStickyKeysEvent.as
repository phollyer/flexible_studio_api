package api.events.sysInfo.getStickyKeys
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetStickyKeysEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var hotkey:Boolean = false;
		public var sticky:Boolean = false;
		
		public function GetStickyKeysEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetStickyKeysEvent = new GetStickyKeysEvent( type );
			e.hotkey = hotkey;
			e.sticky = sticky;
			return e;
		}
	}
}