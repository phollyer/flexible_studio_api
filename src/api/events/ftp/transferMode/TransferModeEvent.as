package api.events.ftp.transferMode
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class TransferModeEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_TRANSFER_MODE:String = "invalidTransferMode";
		
		public function TransferModeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : TransferModeEvent = new TransferModeEvent( type );
			return e;
		}
	}
}