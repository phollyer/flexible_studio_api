package api.events.ftp.transferMode
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class TransferModeEvent extends FtpEvent
	{
		
	/**
	* The TransferModeEvent.INVALID_TRANSFER constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidTransferMode</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidTransferMode
	*/
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