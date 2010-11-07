package api.events.ftp.getLastResponse
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class GetLastResponseEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var serverResponse:String = null;
		
		public function GetLastResponseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetLastResponseEvent = new GetLastResponseEvent( type );
			e.serverResponse = serverResponse;
			return e;
		}
	}
}