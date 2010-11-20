package api.sysInfo.getDomainName
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getDomainName.GetDomainNameEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getDomainName.GetDomainNameEvent")]
	[Bindable]
	public class GetDomainName extends SysInfo
	{
		// Result
		public var domainName:String = null;
		
		public function GetDomainName(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getDomainName():void
		{
			ssCore.SysInfo.getDomainName( {}
										 ,{callback:actionComplete, errorSTR:"getDomainNameError", code:"38004"} );
		}
		override protected function sendResult( r:Object ):void
		{
			domainName = r.result;
			
			var e : GetDomainNameEvent = new GetDomainNameEvent( GetDomainNameEvent.RESULT );
			e.domainName = domainName;
			dispatchEvent( e );
		}
	}
}