package api.sysInfo.getMACAddressList
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getMACAddressList.GetMACAddressListEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getMACAddressList.GetMACAddressListEvent")]
	[Bindable]
	public class GetMACAddressList extends SysInfo
	{
		// Result
		public var addresses:Array = null;
		
		public function GetMACAddressList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getMACAddressList():void
		{
			ssCore.SysInfo.getMACAddressList( {}
										   	 ,{callback:actionComplete, errorSTR:"getMACAddressListError", code:"38009"} );
		}
		override protected function sendResult( r:Object ):void
		{
			addresses = r.result.split( COMMA );
			
			var e : GetMACAddressListEvent = new GetMACAddressListEvent( GetMACAddressListEvent.RESULT );
			e.addresses = addresses;
			dispatchEvent( e );
		}
	}
}