package api.sysInfo.getIPAddress
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getIPAddress.GetIPAddressEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getIPAddress.GetIPAddressEvent")]
	[Bindable]
	public class GetIPAddress extends SysInfo
	{
		// Result
		public var ipAddress:String = null;
		
		public function GetIPAddress(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getIPAddress():void
		{
			ssCore.SysInfo.getIPAddress( {}
										,{callback:actionComplete, errorSTR:"getIPAddressError", code:"38007"} );
		}
		override protected function sendResult( r:Object ):void
		{
			ipAddress = r.result;
			
			var e : GetIPAddressEvent = new GetIPAddressEvent( GetIPAddressEvent.RESULT );
			e.ipAddress = ipAddress;
			dispatchEvent( e );
		}
	}
}