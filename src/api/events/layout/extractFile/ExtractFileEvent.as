package api.events.layout.extractFile
{
	import flash.events.Event;
	
	import api.events.layout.LayoutEvent;

	public class ExtractFileEvent extends LayoutEvent
	{		
		
		public function ExtractFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ExtractFileEvent = new ExtractFileEvent( type );
			return e;
		}
	}
}