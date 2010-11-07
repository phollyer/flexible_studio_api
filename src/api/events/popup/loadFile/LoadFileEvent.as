package api.events.popup.loadFile
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class LoadFileEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NAME:String = "missingName";
		public static const MISSING_PATH:String = "missingPath";
		
		public function LoadFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadFileEvent = new LoadFileEvent( type );
			return e;
		}
	}
}