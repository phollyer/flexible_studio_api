package api.events.keyboard.unblockAll
{
	import flash.events.Event;
	import api.events.keyboard.KeyboardEvent

	public class UnblockAllEvent extends KeyboardEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function UnblockAllEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : UnblockAllEvent = new UnblockAllEvent( type );
			return e;
		}
	}
}