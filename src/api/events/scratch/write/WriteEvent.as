package api.events.scratch.write
{
	import flash.events.Event;
	
	import api.events.scratch.ScratchEvent;

	public class WriteEvent extends ScratchEvent
	{		
		public function WriteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteEvent = new WriteEvent( type );
			return e;
		}
	}
}