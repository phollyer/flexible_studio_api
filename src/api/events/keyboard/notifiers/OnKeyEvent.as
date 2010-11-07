package api.events.keyboard.notifiers
{
	import flash.events.Event;
	
	import api.events.keyboard.KeyboardEvent;

	public class OnKeyEvent extends KeyboardEvent
	{
		public static const COMPLETE:String = "complete";
		public static const CHANGE:String = "change";
		
		public var alt:Boolean = false;
		public var blocked:Boolean = false;
		public var ctrl:Boolean = false;
		public var keycode:String = null;
		public var shift:Boolean = false;
		public var state:Boolean = false;
		
		public function OnKeyEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnKeyEvent = new OnKeyEvent( type );
			e.alt = alt;
			e.blocked = blocked;
			e.ctrl = ctrl;
			e.keycode = keycode;
			e.shift = shift;
			e.state = state;
			return e;
		}
	}
}