package api.printer.setProperties
{
	import api.events.printer.setProperties.SetPropertiesEvent;

	import api.printer.Printer;

	import api.vos.printer.PropertiesVO;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_setProperties.html Northcode Help Documentation
	*/
	public class SetProperties extends Printer
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var properties:PropertiesVO = new PropertiesVO();
		
		/**
		* Constructor for Printer.SetProperties()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_setProperties.html Northcode Help Documentation
		*/
		public function SetProperties(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_setProperties.html Northcode Help Documentation
		*/
		public function setProperties():void
		{			
			ssCore.Printer.setProperties( properties.createObject()
									  	,{callback:actionComplete, errorSTR:"setPropertiesError", code:"32007"} );
		}
	}
}