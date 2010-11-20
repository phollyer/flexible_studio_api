package api.events.keyboard.unblock
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	public class UnblockEvent extends KeyboardEvent
	{
		
		public function UnblockEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable, charCode);
		}
		override public function clone():Event
		{
			var e : UnblockEvent = new UnblockEvent( type );
			return e;
		}
	}
}