package api.events.app.showFileOpen
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowFileOpenEvent extends AppEvent
	{		
		public var file:String = null;
		public var fileList:Array = null;
		public var filterIndex:Number = -1;
		public var filterMask:String = null;
		public var filterName:String = null;
		
		public function ShowFileOpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowFileOpenEvent = new ShowFileOpenEvent( type );
			e.file = file;
			e.fileList = fileList;
			e.filterIndex = filterIndex;
			e.filterMask = filterMask;
			e.filterName = filterName;
			return e;
		}
	}
}