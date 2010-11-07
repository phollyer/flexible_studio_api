package api.events.sysInfo.getLanguageInfo
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetLanguageInfoEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var primaryLanguage:String = null;
		public var subLanguage:String = null;
		
		public function GetLanguageInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetLanguageInfoEvent = new GetLanguageInfoEvent( type );
			e.primaryLanguage = primaryLanguage;
			e.subLanguage = subLanguage;
			return e;
		}
	}
}