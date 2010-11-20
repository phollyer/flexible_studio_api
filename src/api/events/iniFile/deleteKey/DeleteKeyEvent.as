package api.events.iniFile.deleteKey
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class DeleteKeyEvent extends IniFileEvent
	{
		
		public function DeleteKeyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DeleteKeyEvent = new DeleteKeyEvent( type );
			return e;
		}
	}
}