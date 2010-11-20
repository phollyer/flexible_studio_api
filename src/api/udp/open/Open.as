package api.udp.open
{
	import api.events.udp.open.OpenEvent;

	import api.udp.Udp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>port</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PORT
	*/
	[Event(name="missingPort" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_open.html Northcode Help Documentation
	*/
	public class Open extends Udp
	{
		// Required
		public var port:Number = -1;
		
		/**
		* Constructor for Udp.Open()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_open.html Northcode Help Documentation
		*/
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param portNumber
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_open.html Northcode Help Documentation
		*/
		public function open( portNumber:Number = -1 ):void
		{
			port = compareNumbers( portNumber , port );
			
			switch( port )
			{
				case null:
					missingPort();
					break;
				default:
					ssCore.Udp.open( {port:port}
									,{callback:actionComplete, errorSTR:"openError", code:"44002"} );
			}
		}
	}
}