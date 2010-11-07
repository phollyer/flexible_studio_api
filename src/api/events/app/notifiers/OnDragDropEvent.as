package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnDragDropEvent extends AppEvent
	{
		public static const STATUS:String = "status";
		
		public var fileList:Array = null;
		public var folderList:Array = null;
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function OnDragDropEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnDragDropEvent = new OnDragDropEvent( type );
			e.fileList = fileList;
			e.folderList = folderList;
			e.x = x;
			e.y = y;
			return e;
		}
	}
}