package api.sysInfo.getComputerName
{
	import api.events.sysInfo.getComputerName.GetComputerNameEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getComputerName.GetComputerNameEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getComputerName.GetComputerNameEvent")]
	[Bindable]
	/**
	* Retrieves the NetBIOS name of the local computer that is established at system startup.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getComputerName.html Northcode Help Documentation
	*/
	public class GetComputerName extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var computerName:String = null;
		
		/**
		* Constructor for SysInfo.GetComputerName()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getComputerName.html Northcode Help Documentation
		*/
		public function GetComputerName(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieves the NetBIOS name of the local computer that is established at system startup.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getComputerName.html Northcode Help Documentation
		*/
		public function getComputerName():void
		{
			ssCore.SysInfo.getComputerName( {}
										   ,{callback:actionComplete, errorSTR:"getComputerNameError", code:"38001"} );
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
			computerName = r.result;
			
			var e : GetComputerNameEvent = new GetComputerNameEvent( GetComputerNameEvent.RESULT );
			e.computerName = computerName;
			dispatchEvent( e );
		}
	}
}