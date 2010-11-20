package api.udp.open
{
	import flash.events.IEventDispatcher;
	import api.udp.Udp;
	
	[Event(name="missingPort" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Open extends Udp
	{
		// Required
		public var port:Number = -1;
		
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
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