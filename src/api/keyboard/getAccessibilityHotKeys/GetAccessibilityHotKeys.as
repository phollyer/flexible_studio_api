package api.keyboard.getAccessibilityHotKeys
{
	import api.events.keyboard.getAccessibilityHotKeys.GetAccessibilityHotKeysEvent;

	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.keyboard.getAccessibilityHotKeys.GetAccessibilityHotKeysEvent.RESULT
	*/
	[Event(name="result", type="api.events.keyboard.getAccessibilityHotKeys.GetAccessibilityHotKeysEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_getAccessibilityHotKeys.html Northcode Help Documentation
	*/
	public class GetAccessibilityHotKeys extends Keyboard
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var filter:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var highContrast:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var mouse:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var sticky:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var toggle:String = null;
		
		/**
		* Constructor for Keyboard.GetAccessibilityHotKeys()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_getAccessibilityHotKeys.html Northcode Help Documentation
		*/
		public function GetAccessibilityHotKeys(target:IEventDispatcher)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_getAccessibilityHotKeys.html Northcode Help Documentation
		*/
		public function getAccessibilityHotKeys():void
		{
			ssCore.Keyboard.getAccessibilityHotkeys( {}
													,{callback:actionComplete, errorSTR:"getAccessibilityHotKeysError", code:"25001"} );
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
			filter = r.filter
			highContrast = r.highContrast;
			mouse = r.mouse;
			sticky = r.sticky;
			toggle = r.toggle;
			
			var e : GetAccessibilityHotKeysEvent = new GetAccessibilityHotKeysEvent( GetAccessibilityHotKeysEvent.RESULT );
			e.filter = filter;
			e.highContrast = highContrast;
			e.mouse = mouse;
			e.sticky = sticky;
			e.toggle = toggle;
			dispatchEvent( e );
		}
	}
}