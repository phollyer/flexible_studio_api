package api.events.ftp.getFileSize
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class GetFileSizeEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var size:Number = -1;
		
		public function GetFileSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFileSizeEvent = new GetFileSizeEvent( type );
			e.size = size;
			return e;
		}
	}
}