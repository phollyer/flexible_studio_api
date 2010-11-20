package api.ftp.port
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Event(name="complete" , type="PortEvent")];
	[Event(name="PortError" , type="FtpError")];
	[Bindable]
	public class Port extends Ftp
	{
		public static const MIN_PORT_NUMBER:int = 1;
		public static const MAX_PORT_NUMBER:int = 65535;
		
		// Optional
		public var portNumber:int = 21;
		
		public function Port(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function port():void
		{
			switch( portNumber >= MIN_PORT_NUMBER && portNumber <= MAX_PORT_NUMBER )
			{
				case true:
					ssCore.Ftp.port( {port:portNumber}
									,{callback:actionComplete, errorSTR:"portError", code:"7021"} );
					break;
				case false:
					invalidPortNumber();
			}
		}
		private function invalidPortNumber():void
		{
			var e : PortEvent = new PortEvent( PortEvent.RESULT_PORT_NUMBER );
			dispatchEvent( e );
		}
	}
}