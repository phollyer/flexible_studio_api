package api.events.win.saveImage
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SaveImageEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
		public function SaveImageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SaveImageEvent = new SaveImageEvent( type );
			return e;
		}
	}
}