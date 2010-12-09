package api.clipboard.getData
{
	import api.clipboard.Clipboard;

	import api.events.clipboard.getData.GetDataEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.clipboard.getData.GetDataEvent.RESULT
	*/
	[Event(name="result", type="api.events.clipboard.getData.GetDataEvent")]
	[Bindable]
	/**
	* Retrieve data from the clipboard. Recognized formats are 'TEXT', 'RTF'. Unknown data formats are assigned a type of 'UNKNOWN'.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Clipboard_getData.html Northcode Help Documentation
	*/
	public class GetData extends Clipboard
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var asText:Boolean = false;
		
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:Object = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var dataType:Object = null;
		
		/**
		* Constructor for Clipboard.GetData()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Clipboard_getData.html Northcode Help Documentation
		*/
		public function GetData(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieve data from the clipboard. Recognized formats are 'TEXT', 'RTF'. Unknown data formats are assigned a type of 'UNKNOWN'.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Clipboard_getData.html Northcode Help Documentation
		*/
		public function getData():void
		{
			ssCore.Clipboard.getData( {asText:asText} , {callback:actionComplete, errorSTR:"getDataError", code:"12002"} );
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
			data = r.result;
			dataType = r.type;
			
			var e : GetDataEvent = new GetDataEvent( GetDataEvent.RESULT );
			e.data = data;
			e.dataType = dataType;
			dispatchEvent( e );
		}
	}
}