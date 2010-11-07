package api.events.desktop.saveImage
{
	import flash.events.Event;
	
	import api.events.desktop.DesktopEvent;

	public class SaveImageEvent extends DesktopEvent
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