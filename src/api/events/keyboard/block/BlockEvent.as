package api.events.keyboard.block
{
	import flash.events.Event;
	import api.events.keyboard.KeyboardEvent

	public class BlockEvent extends KeyboardEvent
	{
		
		public function BlockEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BlockEvent = new BlockEvent( type );
			return e;
		}
	}
}