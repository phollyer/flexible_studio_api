package api.events.fileSys.createDir
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class CreateDirEvent extends FileSysEvent
	{
		
		public function CreateDirEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CreateDirEvent = new CreateDirEvent( type );
			return e;
		}
	}
}