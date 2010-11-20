package api.events.iniFile.deleteSection
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class DeleteSectionEvent extends IniFileEvent
	{
		
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