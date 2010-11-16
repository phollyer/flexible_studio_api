package api.events.app.showFolderBrowser
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowFolderBrowserEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var folderPath:String = null;
		
		public function ShowFolderBrowserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowFolderBrowserEvent = new ShowFolderBrowserEvent( type );
			e.folderPath = folderPath;
			return e;
		}
	}
}