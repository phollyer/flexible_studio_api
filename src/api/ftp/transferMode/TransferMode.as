package api.ftp.transferMode
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Bindable]
	public class TransferMode extends Ftp
	{
		public static const BINARY:String = "binary";
		public static const ASCII:String = "ascii";
		
		// Optional
		public var transferMode:String = BINARY;
		
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