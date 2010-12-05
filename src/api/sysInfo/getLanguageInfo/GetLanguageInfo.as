package api.sysInfo.getLanguageInfo
{
	import api.events.sysInfo.getLanguageInfo.GetLanguageInfoEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getLanguageInfo.GetLanguageInfoEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getLanguageInfo.GetLanguageInfoEvent")]
	[Bindable]
	/**
	* Determine the current users language settings.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getLanguageInfo.html Northcode Help Documentation
	*/
	public class GetLanguageInfo extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var primaryLanguage:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var subLanguage:String = null;
		
		/**
		* Constructor for SysInfo.GetLanguageInfo()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getLanguageInfo.html Northcode Help Documentation
		*/
		public function GetLanguageInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Determine the current users language settings.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getLanguageInfo.html Northcode Help Documentation
		*/
		public function getLanguageInfo():void
		{
			ssCore.SysInfo.getLanguageInfo( {}
										   ,{callback:actionComplete, errorSTR:"getLanguageInfoError", code:"38008"} );
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
			primaryLanguage = r.result.split( COMMA )[ 0 ];
			subLanguage = r.result.split( COMMA )[ 1 ];
			
			var e : GetLanguageInfoEvent = new GetLanguageInfoEvent( GetLanguageInfoEvent.RESULT );
			e.primaryLanguage = primaryLanguage;
			e.subLanguage = subLanguage;
			dispatchEvent( e );
		}
	}
}