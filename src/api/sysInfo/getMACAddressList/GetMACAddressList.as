package api.sysInfo.getMACAddressList
{
	import api.events.sysInfo.getMACAddressList.GetMACAddressListEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getMACAddressList.GetMACAddressListEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getMACAddressList.GetMACAddressListEvent")]
	[Bindable]
	/**
	* Obtain a list of available MAC addresses.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getMACAddressList.html Northcode Help Documentation
	*/
	public class GetMACAddressList extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var addresses:Array = null;
		
		/**
		* Constructor for SysInfo.GetMACAddressList()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getMACAddressList.html Northcode Help Documentation
		*/
		public function GetMACAddressList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Obtain a list of available MAC addresses.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getMACAddressList.html Northcode Help Documentation
		*/
		public function getMACAddressList():void
		{
			ssCore.SysInfo.getMACAddressList( {}
										   	 ,{callback:actionComplete, errorSTR:"getMACAddressListError", code:"38009"} );
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
			addresses = r.result.split( COMMA );
			
			var e : GetMACAddressListEvent = new GetMACAddressListEvent( GetMACAddressListEvent.RESULT );
			e.addresses = addresses;
			dispatchEvent( e );
		}
	}
}