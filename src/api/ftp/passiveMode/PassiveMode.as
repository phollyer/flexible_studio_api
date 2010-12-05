package api.ftp.passiveMode
{
	import api.events.ftp.passiveMode.PassiveModeEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Set the FTP connection to use passive mode.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_passiveMode.html Northcode Help Documentation
	*/
	public class PassiveMode extends Ftp
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var passive:Boolean = false;
		
		/**
		* Constructor for Ftp.PassiveMode()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_passiveMode.html Northcode Help Documentation
		*/
		public function PassiveMode(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the FTP connection to use passive mode.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_passiveMode.html Northcode Help Documentation
		*/
		public function passiveMode():void
		{
			ssCore.Ftp.passiveMode( {passive:passive}
								   ,{callback:actionComplete, errorSTR:"passiveModeError", code:"7020"} );
		}
	}
}