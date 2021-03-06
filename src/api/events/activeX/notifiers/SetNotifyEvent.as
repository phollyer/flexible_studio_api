package api.events.activeX.notifiers
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetNotifyEvent extends ActiveXEvent
	{		
		public var result:Array = null;
		
		public function SetNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetNotifyEvent = new SetNotifyEvent( type );
			e.result = result;
			return e;
		}
	}
}