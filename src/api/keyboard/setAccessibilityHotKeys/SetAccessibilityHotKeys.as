package api.keyboard.setAccessibilityHotKeys
{
	import flash.events.IEventDispatcher;
	import api.keyboard.Keyboard;
	
	[Bindable]
	public class SetAccessibilityHotKeys extends Keyboard
	{
		// optional
		public var filter:Boolean = false;
		public var highContrast:Boolean = false;
		public var mouse:Boolean = false;
		public var sticky:Boolean = false;
		public var toggle:Boolean = false;
		
		public function SetAccessibilityHotKeys(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setAccessibilityHotKeys():void
		{
			ssCore.Keyboard.setAccessibilityHotkeys( { filter:filter , highContrast:highContrast , mouse:mouse , sticky:sticky , toggle:toggle}
													,{callback:actionComplete, errorSTR:"setAccessibilityHotKeysError", code:"25007"} );
		}
	}
}