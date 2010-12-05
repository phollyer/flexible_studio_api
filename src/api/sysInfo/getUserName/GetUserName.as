package api.sysInfo.getUserName
{
	import api.events.sysInfo.getUserName.GetUserNameEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getUserName.GetUserNameEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getUserName.GetUserNameEvent")]
	[Bindable]
	/**
	* Get the name of the currently logged in user.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getUserName.html Northcode Help Documentation
	*/
	public class GetUserName extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var userName:String = null;
		
		/**
		* Constructor for SysInfo.GetUserName()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getUserName.html Northcode Help Documentation
		*/
		public function GetUserName(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Get the name of the currently logged in user.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getUserName.html Northcode Help Documentation
		*/
		public function getUserName():void
		{
			ssCore.SysInfo.getUserName( {}
									   ,{callback:actionComplete, errorSTR:"getUserNameError", code:"38014"} );
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
			userName = r.result;
			
			var e : GetUserNameEvent = new GetUserNameEvent( GetUserNameEvent.RESULT );
			e.userName = userName;
			dispatchEvent( e );
		}
	}
}