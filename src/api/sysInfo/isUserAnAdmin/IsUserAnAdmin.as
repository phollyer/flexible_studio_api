package api.sysInfo.isUserAnAdmin
{
	import api.events.sysInfo.isUserAnAdmin.IsUserAnAdminEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.isUserAnAdmin.IsUserAnAdminEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.isUserAnAdmin.IsUserAnAdminEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_isUserAnAdmin.html Northcode Help Documentation
	*/
	public class IsUserAnAdmin extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var isAdmin:Boolean = false;
		
		/**
		* Constructor for SysInfo.IsUserAnAdmin()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_isUserAnAdmin.html Northcode Help Documentation
		*/
		public function IsUserAnAdmin(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_isUserAnAdmin.html Northcode Help Documentation
		*/
		public function isUserAnAdmin():void
		{
			ssCore.SysInfo.isUserAnAdmin( {}
									   	 ,{callback:actionComplete, errorSTR:"isUserAnAdminError", code:"38017"} );
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
			isAdmin = checkBoolean( r.result );
			
			var e : IsUserAnAdminEvent = new IsUserAnAdminEvent( IsUserAnAdminEvent.RESULT );
			e.isAdmin = isAdmin;
			dispatchEvent( e );
		}
	}
}