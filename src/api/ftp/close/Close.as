package api.ftp.close
{
	import api.events.ftp.close.CloseEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_close.html Northcode Help Documentation
	*/
	public class Close extends Ftp
	{
		/**
		* Constructor for Ftp.Close()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_close.html Northcode Help Documentation
		*/
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_close.html Northcode Help Documentation
		*/
		public function close():void
		{
			ssCore.Ftp.close( {}
							 ,{callback:actionComplete, errorSTR:"closeError", code:"7001"} );
		}
	}
}