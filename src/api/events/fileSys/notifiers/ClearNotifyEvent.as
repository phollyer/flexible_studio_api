package api.events.fileSys.notifiers
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class ClearNotifyEvent extends FileSysEvent
	{
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}
	}
}