package api.tcp.listen
{
	import flash.events.IEventDispatcher;
	import api.tcp.Tcp;
	
	[Event(name="missingPort" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Listen extends Tcp
	{		
		// Optional
		public var localAddress:String = null;
		
		// Required
		public var port:Number = -1;
		
		public function Listen(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function listen( portNumber:Number = -1 ):void
		{
			port = compareNumbers( portNumber , port );
			
			switch( port > -1 )
			{
				case false:
					missingPort();
					break;
				default:
					var __o:Object = new Object();
					__o.port = port;
					switch( localAddress != null )
					{
						case true:
							__o.localAddress = localAddress;
					}
					ssCore.Tcp.listen( __o
									 ,{callback:actionComplete, errorSTR:"listenError", code:"40001"} );
			}
		}
	}
}