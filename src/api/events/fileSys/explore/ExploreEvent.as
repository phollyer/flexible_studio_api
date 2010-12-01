package api.events.fileSys.explore
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class ExploreEvent extends FileSysEvent
	{
		
		public function ExploreEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ExploreEvent = new ExploreEvent( type );
			return e;
		}
	}
}