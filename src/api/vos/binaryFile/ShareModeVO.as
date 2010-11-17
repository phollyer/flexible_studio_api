package api.events.binaryFile
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class BinaryFileEvent extends KernelEvent
	{
		public function BinaryFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BinaryFileEvent = new BinaryFileEvent( type );
			return e;
		}
	}
}