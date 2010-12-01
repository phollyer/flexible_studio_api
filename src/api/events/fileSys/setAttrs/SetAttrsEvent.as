package api.events.fileSys.setAttrs
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class SetAttrsEvent extends FileSysEvent
	{
		
		public function SetAttrsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetAttrsEvent = new SetAttrsEvent( type );
			return e;
		}
	}
}