package api.events.sysTools.convertIconToJpeg
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class ConvertIconToJpegEvent extends SysToolsEvent
	{
		
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