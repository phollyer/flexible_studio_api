package api.sysInfo.getDomainName
{
	import api.events.sysInfo.getDomainName.GetDomainNameEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getDomainName.GetDomainNameEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getDomainName.GetDomainNameEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getDomainName.html Northcode Help Documentation
	*/
	public class GetDomainName extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var domainName:String = null;
		
		/**
		* Constructor for SysInfo.GetDomainName()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getDomainName.html Northcode Help Documentation
		*/
		public function GetDomainName(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getDomainName.html Northcode Help Documentation
		*/
		public function getDomainName():void
		{
			ssCore.SysInfo.getDomainName( {}
										 ,{callback:actionComplete, errorSTR:"getDomainNameError", code:"38004"} );
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
			domainName = r.result;
			
			var e : GetDomainNameEvent = new GetDomainNameEvent( GetDomainNameEvent.RESULT );
			e.domainName = domainName;
			dispatchEvent( e );
		}
	}
}