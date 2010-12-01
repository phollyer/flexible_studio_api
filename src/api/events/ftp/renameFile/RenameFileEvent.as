package api.events.ftp.renameFile
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class RenameFileEvent extends FtpEvent
	{
		
		public function RenameFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RenameFileEvent = new RenameFileEvent( type );
			return e;
		}
	}
}