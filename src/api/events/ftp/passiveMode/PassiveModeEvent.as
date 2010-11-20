package api.events.ftp.passiveMode
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class PassiveModeEvent extends FtpEvent
	{
		
		public function PassiveModeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PassiveModeEvent = new PassiveModeEvent( type );
			return e;
		}
	}
}