package api.keyboard.setAccessibilityHotKeys
{
	import api.events.keyboard.setAccessibilityHotKeys.SetAccessibilityHotKeysEvent;

	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_setAccessibilityHotKeys.html Northcode Help Documentation
	*/
	public class SetAccessibilityHotKeys extends Keyboard
	{
		// optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var filter:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var highContrast:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var mouse:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var sticky:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var toggle:Boolean = false;
		
		/**
		* Constructor for Keyboard.SetAccessibilityHotKeys()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_setAccessibilityHotKeys.html Northcode Help Documentation
		*/
		public function SetAccessibilityHotKeys(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_setAccessibilityHotKeys.html Northcode Help Documentation
		*/
		public function setAccessibilityHotKeys():void
		{
			ssCore.Keyboard.setAccessibilityHotkeys( { filter:filter , highContrast:highContrast , mouse:mouse , sticky:sticky , toggle:toggle}
													,{callback:actionComplete, errorSTR:"setAccessibilityHotKeysError", code:"25007"} );
		}
	}
}