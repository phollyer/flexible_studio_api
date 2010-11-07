package api.events.sysTools.convertIconToJpeg
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class ConvertIconToJpegEvent extends SysToolsEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HEIGHT:String = "missingHeight";
		public static const MISSING_JPEG:String = "missingJpeg";
		public static const MISSING_PATH:String = "missingPath";
		public static const MISSING_WIDTH:String = "missingWidth";
		
		public function ConvertIconToJpegEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ConvertIconToJpegEvent = new ConvertIconToJpegEvent( type );
			return e;
		}
	}
}