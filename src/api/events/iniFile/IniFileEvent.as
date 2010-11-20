package api.events.iniFile
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class IniFileEvent extends SWFStudioEvent
	{
		public function IniFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IniFileEvent = new IniFileEvent( type );
			return e;
		}
	}
}