package api.http.port
{
	import api.events.http.port.PortEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	[Event(name="complete" , type="PortEvent")];
	[Event(name="PortError" , type="HttpError")];
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_port.html Northcode Help Documentation
	*/
	public class Port extends Http
	{
		public static const MIN_PORT_NUMBER:int = 1;
		public static const MAX_PORT_NUMBER:int = 65535;
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>21</code>
		*/
		public var portNumber:int = 21;
		
		/**
		* Constructor for Http.Port()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_port.html Northcode Help Documentation
		*/
		public function Port(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_port.html Northcode Help Documentation
		*/
		public function port():void
		{
			switch( portNumber >= MIN_PORT_NUMBER && portNumber <= MAX_PORT_NUMBER )
			{
				case true:
					ssCore.Http.port( {port:portNumber}
									 ,{callback:actionComplete, errorSTR:"portError", code:"4022"} );
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