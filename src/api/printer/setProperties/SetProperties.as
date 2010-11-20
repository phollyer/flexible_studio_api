package api.printer.setProperties
{
	import flash.events.IEventDispatcher;
	import api.printer.Printer;
	import api.vos.printer.PropertiesVO;
	
	[Bindable]
	public class SetProperties extends Printer
	{
		// Optional
		public var properties:PropertiesVO = new PropertiesVO();
		
		public function SetProperties(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setProperties():void
		{			
			ssCore.Printer.setProperties( properties.createObject()
									  	,{callback:actionComplete, errorSTR:"setPropertiesError", code:"32007"} );
		}
	}
}