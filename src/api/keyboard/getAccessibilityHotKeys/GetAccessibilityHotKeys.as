package api.keyboard.getAccessibilityHotKeys
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.keyboard.getAccessibilityHotKeys.GetAccessibilityHotKeysEvent;
	import api.keyboard.Keyboard;
	
	[Event(name="result", type="api.events.keyboard.getAccessibilityHotKeys.GetAccessibilityHotKeysEvent")]
	[Bindable]
	public class GetAccessibilityHotKeys extends Keyboard
	{
		// Results
		public var filter:String = null;
		public var highContrast:String = null;
		public var mouse:String = null;
		public var sticky:String = null;
		public var toggle:String = null;
		
		public function GetAccessibilityHotKeys(target:IEventDispatcher)
		{
			super(target);
		}
		public function getAccessibilityHotKeys():void
		{
			ssCore.Keyboard.getAccessibilityHotkeys( {}
													,{callback:actionComplete, errorSTR:"getAccessibilityHotKeysError", code:"25001"} );
		}
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