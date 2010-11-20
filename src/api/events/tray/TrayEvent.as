package api.events.tray
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class TrayEvent extends SWFStudioEvent
	{		
		public function TrayEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : TrayEvent = new TrayEvent( type );
			return e;
		}
	}
}