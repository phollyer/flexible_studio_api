package api.events.layout.getFileList
{
	import flash.events.Event;
	
	import api.events.layout.LayoutEvent;

	public class GetFileListEvent extends LayoutEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_FORMAT:String = "invalidFormat";
		public static const RESULT:String = "result";
		
		public var fileList:Array = null;
		public var text:String = null;
		public var xml:XML = null;
		
		public function GetFileListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFileListEvent = new GetFileListEvent( type );
			e.fileList = fileList;
			e.text = text;
			e.xml = xml;
			return e;
		}
	}
}