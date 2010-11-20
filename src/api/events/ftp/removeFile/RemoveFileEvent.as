package api.events.ftp.removeFile
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class RemoveFileEvent extends FtpEvent
	{
		
		public function RemoveFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RemoveFileEvent = new RemoveFileEvent( type );
			return e;
		}
	}
}