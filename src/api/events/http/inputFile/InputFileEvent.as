package api.events.http.inputFile
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class InputFileEvent extends HttpEvent
	{
		
		public function InputFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : InputFileEvent = new InputFileEvent( type );
			return e;
		}
	}
}