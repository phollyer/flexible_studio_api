package api.events.sysTools.resizeImage
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class ResizeImageEvent extends SysToolsEvent
	{
		
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