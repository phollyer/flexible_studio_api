package api.events.fileSys.explore
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class ExploreEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
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