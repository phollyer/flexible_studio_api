package api.events.sysTools.resizeImage
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class ResizeImageEvent extends SysToolsEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DESTINATION:String = "missingDestination";
		public static const MISSING_HEIGHT:String = "missingHeight";
		public static const MISSING_QUALITY:String = "missingQuality";
		public static const MISSING_SOURCE:String = "missingSource";
		public static const MISSING_WIDTH:String = "missingWidth";
		
		public function ResizeImageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ResizeImageEvent = new ResizeImageEvent( type );
			return e;
		}
	}
}