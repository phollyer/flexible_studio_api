package api.sysInfo.getStickyKeys
{
	import api.events.sysInfo.getStickyKeys.GetStickyKeysEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getStickyKeys.GetStickyKeysEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getStickyKeys.GetStickyKeysEvent")]
	[Bindable]
	/**
	* Returns the state of the StickyKeys accessibility features.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getStickyKeys.html Northcode Help Documentation
	*/
	public class GetStickyKeys extends SysInfo
	{
		// Result
		/**
		* A boolean value that indicates whether the sticky keys hotkey (pressing the SHIFT key 5 times) is enabled (TRUE) or not (FALSE).
		*
		* @defaultValue <code>false</code>
		*/
		public var hotkey:Boolean = false;
		/**
		* A boolean value that indicates whether the sticky keys feature is enabled (TRUE) or not (FALSE).
		*
		* @defaultValue <code>false</code>
		*/
		public var sticky:Boolean = false;
		
		/**
		* Constructor for SysInfo.GetStickyKeys()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getStickyKeys.html Northcode Help Documentation
		*/
		public function GetStickyKeys(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Returns the state of the StickyKeys accessibility features.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getStickyKeys.html Northcode Help Documentation
		*/
		public function getStickyKeys():void
		{
			ssCore.SysInfo.getStickyKeys( {}
										 ,{callback:actionComplete, errorSTR:"getStickyKeysError", code:"38013"} );
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
			hotkey = checkBoolean( r.hotkey );
			sticky = checkBoolean( r.sticky );
			
			var e : GetStickyKeysEvent = new GetStickyKeysEvent( GetStickyKeysEvent.RESULT );
			e.hotkey = hotkey;
			e.sticky = sticky;
			dispatchEvent( e );
		}
	}
}