package api.tcp.open
{
	import api.events.tcp.open.OpenEvent;

	import api.tcp.Tcp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>destination</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DESTINATION
	*/
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPort" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Opens a socket on the selected port, and prepares it for sending and receiving messages.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_open.html Northcode Help Documentation
	*/
	public class Open extends Tcp
	{		
		// Required
		/**
		* IP name or address to connect to.
		*
		* @defaultValue <code>null</code>
		*/
		public var destination:String = null;
		public var port:Number = -1;
		
		/**
		* Constructor for Tcp.Open()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_open.html Northcode Help Documentation
		*/
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Opens a socket on the selected port, and prepares it for sending and receiving messages.
		*
		*
		* @param destinationSTR
		*
		* @param portNumber
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_open.html Northcode Help Documentation
		*/
		public function open( destinationSTR:String = null , portNumber:Number = -1 ):void
		{
			destination = compareStrings( destinationSTR , destination );
			port = compareNumbers( portNumber , port );
			
			switch( destination )
			{
				case null:
					missingDestination();
					break;
				default:
					switch( port > -1 )
					{
						case false:
							missingPort();
							break;
						default:
							ssCore.Tcp.open( {}
											,{callback:actionComplete, errorSTR:"openError", code:"40002"} );
					}
			}
		}

	}
}