package api.events.ftp
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class FtpEvent extends SWFStudioEvent
	{		
		public function FtpEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FtpEvent = new FtpEvent(type);
			return e;
		}
	}
}