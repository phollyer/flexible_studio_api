package api.events.ftp.localFile
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class LocalFileEvent extends FtpEvent
	{
		
		public function LocalFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LocalFileEvent = new LocalFileEvent( type );
			return e;
		}
	}
}