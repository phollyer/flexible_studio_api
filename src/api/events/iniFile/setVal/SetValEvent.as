package api.events.iniFile.setVal
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class SetValEvent extends IniFileEvent
	{
		
		public function SetValEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetValEvent = new SetValEvent( type );
			return e;
		}
	}
}