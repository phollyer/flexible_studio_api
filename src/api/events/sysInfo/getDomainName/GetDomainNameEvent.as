package api.events.sysInfo.getDomainName
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetDomainNameEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var domainName:String = null;
		
		public function GetDomainNameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDomainNameEvent = new GetDomainNameEvent( type );
			e.domainName = domainName;
			return e;
		}
	}
}