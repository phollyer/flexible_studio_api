package api.events.sysTools
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class SysToolsEvent extends SWFStudioEvent
	{
		public function SysToolsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SysToolsEvent = new SysToolsEvent( type );
			return e;
		}
	}
}