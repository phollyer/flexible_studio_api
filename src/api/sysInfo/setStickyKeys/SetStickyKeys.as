package api.sysInfo.setStickyKeys
{
	import api.events.sysInfo.setStickyKeys.SetStickyKeysEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Sets the state of the StickyKeys accessibility feature. When the StickyKeys is enabled, the user can press a modifier key (SHIFT, CTRL, or ALT) and then another key in sequence rather than at the same time, to enter shifted (modified) characters and other key combinations. Pressing a modifier key once latches the key down until the user presses a non-modifier key or clicks a mouse button. Pressing a modifier key twice locks the key until the user presses the key a third time.
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
		* Sets the state of the StickyKeys accessibility feature. When the StickyKeys is enabled, the user can press a modifier key (SHIFT, CTRL, or ALT) and then another key in sequence rather than at the same time, to enter shifted (modified) characters and other key combinations. Pressing a modifier key once latches the key down until the user presses a non-modifier key or clicks a mouse button. Pressing a modifier key twice locks the key until the user presses the key a third time.
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