package api.events.app.showFileSave
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowFileSaveEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_FILE_OBJ:String = "missingFileOBJ";
		public static const RESULT:String = "result";
		
		public var file:String = null;
		public var filterIndex:Number = -1;
		public var filterMask:String = null;
		public var filterName:String = null;
		
		public function ShowFileSaveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowFileSaveEvent = new ShowFileSaveEvent( type );
			e.file = file;
			e.filterIndex = filterIndex;
			e.filterMask = filterMask;
			e.filterName = filterName;
			return e;
		}
	}
}