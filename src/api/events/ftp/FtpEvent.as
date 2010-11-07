package api.events.ftp
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class FtpEvent extends KernelEvent
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