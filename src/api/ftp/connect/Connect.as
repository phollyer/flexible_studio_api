package api.ftp.connect
{
	import api.events.ftp.connect.ConnectEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_connect.html Northcode Help Documentation
	*/
	public class Connect extends Ftp
	{
		/**
		* Constructor for Ftp.Connect()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_connect.html Northcode Help Documentation
		*/
		public function Connect(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_connect.html Northcode Help Documentation
		*/
		public function connect():void
		{
			ssCore.Ftp.connect( {}
							   ,{callback:actionComplete, errorSTR:"connectError", code:"7010"} );
		}
	}
}