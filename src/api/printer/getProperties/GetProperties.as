package api.printer.getProperties
{
	import api.events.printer.getProperties.GetPropertiesEvent;

	import api.printer.Printer;

	import api.vos.printer.PropertiesVO;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.printer.getProperties.GetPropertiesEvent.RESULT
	*/
	[Event(name="result", type="api.events.printer.getProperties.GetPropertiesEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_getProperties.html Northcode Help Documentation
	*/
	public class GetProperties extends Printer
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var properties:PropertiesVO = new PropertiesVO();
		
		/**
		* Constructor for Printer.GetProperties()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_getProperties.html Northcode Help Documentation
		*/
		public function GetProperties(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_getProperties.html Northcode Help Documentation
		*/
		public function getProperties():void
		{
			ssCore.Printer.getProperties( {}
										 ,{callback:actionComplete, errorSTR:"getPropertiesError", code:"32002"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			properties = r as PropertiesVO;
			
			var e : GetPropertiesEvent = new GetPropertiesEvent( GetPropertiesEvent.RESULT );
			e.properties = properties;
			dispatchEvent( e );
		}
	}
}