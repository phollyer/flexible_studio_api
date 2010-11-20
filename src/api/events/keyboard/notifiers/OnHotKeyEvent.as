package api.events.keyboard.notifiers
{
	import flash.events.Event;
	
	import api.events.keyboard.KeyboardEvent;

	public class OnHotKeyEvent extends KeyboardEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
		public var hotKeyName:String = null;
		
		public function OnHotKeyEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnHotKeyEvent = new OnHotKeyEvent( type );
			e.hotKeyName = hotKeyName;
			return e;
		}
	}
}