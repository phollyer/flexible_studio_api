package api.events.keyboard.setAccessibilityHotKeys
{
	import flash.events.Event;
	import api.events.keyboard.KeyboardEvent

	public class SetAccessibilityHotKeysEvent extends KeyboardEvent
	{
		
		public function SetAccessibilityHotKeysEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetAccessibilityHotKeysEvent = new SetAccessibilityHotKeysEvent( type );
			return e;
		}
	}
}