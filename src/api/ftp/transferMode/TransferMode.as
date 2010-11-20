package api.ftp.transferMode
{
	import api.events.ftp.transferMode.TransferModeEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_transferMode.html Northcode Help Documentation
	*/
	public class TransferMode extends Ftp
	{
		public static const BINARY:String = "binary";
		public static const ASCII:String = "ascii";
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>BINARY</code>
		*/
		public var transferMode:String = BINARY;
		
		/**
		* Constructor for Ftp.TransferMode()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_transferMode.html Northcode Help Documentation
		*/
		public function TransferMode(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setTransferMode():void
		{
			switch( transferMode )
			{
				case BINARY:
				case ASCII:
					ssCore.Ftp.transferMode( {transferMode:transferMode}
											,{callback:actionComplete, errorSTR:"transferModeError", code:"7027"} );
					break;
				default:
					invalidMode();
			}
		}
		private function invalidMode():void
		{
			var e : TransferModeEvent = new TransferModeEvent( TransferModeEvent.RESULT_TRANSFER_MODE );
			dispatchEvent( e );
		}
	}
}