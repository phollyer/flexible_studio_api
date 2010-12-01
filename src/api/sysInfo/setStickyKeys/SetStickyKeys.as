package api.sysInfo.setStickyKeys
{
	import api.events.sysInfo.setStickyKeys.SetStickyKeysEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_setStickyKeys.html Northcode Help Documentation
	*/
	public class SetStickyKeys extends SysInfo
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var hotkey:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var sticky:Boolean = false;
		
		/**
		* Constructor for SysInfo.SetStickyKeys()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_setStickyKeys.html Northcode Help Documentation
		*/
		public function SetStickyKeys(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_setStickyKeys.html Northcode Help Documentation
		*/
		public function setStickyKeys():void
		{
			ssCore.SysInfo.setStickyKeys( {hotkey:hotkey , sticky:sticky}
										 ,{callback:actionComplete, errorSTR:"setStickyKeysError", code:"3808"} );
		}
	}
}