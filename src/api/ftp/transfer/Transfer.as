package api.ftp.transfer
{
	import api.events.ftp.transfer.TransferEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Set the transfer mode for upload and download operations.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_transfer.html Northcode Help Documentation
	*/
	public class Transfer extends Ftp
	{
		/**
		* Constructor for Ftp.Transfer()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_transfer.html Northcode Help Documentation
		*/
		public function Transfer(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the transfer mode for upload and download operations.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_transfer.html Northcode Help Documentation
		*/
		public function transfer():void
		{
			ssCore.Ftp.transfer( {}
								,{callback:actionComplete, errorSTR:"transferError", code:"7026"} );
		}
	}
}