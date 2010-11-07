package api.tcp.open
{
	import flash.events.IEventDispatcher;
	import api.tcp.Tcp;
	
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPort" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Open extends Tcp
	{		
		// Required
		public var destination:String = null;
		public var port:Number = -1;
		
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
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