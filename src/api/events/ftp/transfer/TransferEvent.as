package api.events.ftp.transfer
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class TransferEvent extends FtpEvent
	{
		
		public function TransferEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : TransferEvent = new TransferEvent( type );
			return e;
		}
	}
}