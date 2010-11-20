package api.events.iniFile.deleteSection
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class DeleteSectionEvent extends IniFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const MISSING_SECTION:String = "missingSection";
		
		public function DeleteSectionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DeleteSectionEvent = new DeleteSectionEvent( type );
			return e;
		}
	}
}