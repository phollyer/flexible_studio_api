package api.printer.getProperties
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.printer.getProperties.GetPropertiesEvent;
	import api.printer.Printer;
	import api.vos.printer.PropertiesVO;
	
	[Event(name="result", type="api.events.printer.getProperties.GetPropertiesEvent")]
	[Bindable]
	public class GetProperties extends Printer
	{
		// Result
		public var properties:PropertiesVO = new PropertiesVO();
		
		public function GetProperties(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getProperties():void
		{
			ssCore.Printer.getProperties( {}
										 ,{callback:actionComplete, errorSTR:"getPropertiesError", code:"32002"} );
		}
		override protected function sendResult( r:Object ):void
		{
			properties = r as PropertiesVO;
			
			var e : GetPropertiesEvent = new GetPropertiesEvent( GetPropertiesEvent.RESULT );
			e.properties = properties;
			dispatchEvent( e );
		}
	}
}