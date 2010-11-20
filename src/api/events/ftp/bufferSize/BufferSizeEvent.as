package api.events.ftp.bufferSize
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class BufferSizeEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function BufferSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BufferSizeEvent = new BufferSizeEvent( type );
			return e;
		}
	}
}