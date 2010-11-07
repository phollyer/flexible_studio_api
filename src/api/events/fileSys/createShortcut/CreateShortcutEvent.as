package api.events.fileSys.createShortcut
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class CreateShortcutEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_SHORTCUT_PATH:String = "missingShortcutPath";
		public static const MISSING_SOURCE_PATH:String = "missingSourcePath";
		
		public function CreateShortcutEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CreateShortcutEvent = new CreateShortcutEvent( type );
			return e;
		}
	}
}