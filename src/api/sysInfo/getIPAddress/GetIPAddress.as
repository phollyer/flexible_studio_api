package api.sysInfo.getIPAddress
{
	import api.events.sysInfo.getIPAddress.GetIPAddressEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getIPAddress.GetIPAddressEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getIPAddress.GetIPAddressEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getIPAddress.html Northcode Help Documentation
	*/
	public class GetIPAddress extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var ipAddress:String = null;
		
		/**
		* Constructor for SysInfo.GetIPAddress()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getIPAddress.html Northcode Help Documentation
		*/
		public function GetIPAddress(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getIPAddress.html Northcode Help Documentation
		*/
		public function getIPAddress():void
		{
			ssCore.SysInfo.getIPAddress( {}
										,{callback:actionComplete, errorSTR:"getIPAddressError", code:"38007"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			ipAddress = r.result;
			
			var e : GetIPAddressEvent = new GetIPAddressEvent( GetIPAddressEvent.RESULT );
			e.ipAddress = ipAddress;
			dispatchEvent( e );
		}
	}
}