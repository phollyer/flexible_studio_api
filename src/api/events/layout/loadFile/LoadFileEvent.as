package api.events.layout.loadFile
{
	import flash.events.Event;
	
	import api.events.layout.LayoutEvent;

	public class LoadFileEvent extends LayoutEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_RESOURCE:String = "missingResource";
		public static const RESULT:String = "result";
		
		public var data:String = null;
		
		public function LoadFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadFileEvent = new LoadFileEvent( type );
			e.data = data;
			return e;
		}
	}
}