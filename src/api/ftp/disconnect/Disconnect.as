package api.ftp.disconnect
{
	import api.events.ftp.disconnect.DisconnectEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_disconnect.html Northcode Help Documentation
	*/
	public class Disconnect extends Ftp
	{
		/**
		* Constructor for Ftp.Disconnect()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_disconnect.html Northcode Help Documentation
		*/
		public function Disconnect(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_disconnect.html Northcode Help Documentation
		*/
		public function disconnect():void
		{
			ssCore.Ftp.disconnect( {}
								  ,{callback:actionComplete, errorSTR:"disconnectError", code:"7003"} );
		}
	}
}