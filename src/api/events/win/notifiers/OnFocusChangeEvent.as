package api.events.win.notifiers
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class OnFocusChangeEvent extends WinEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
		public var data:String = null;
		
		public function OnFocusChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnFocusChangeEvent = new OnFocusChangeEvent( type );
			e.data = data;
			return e;
		}
	}
}