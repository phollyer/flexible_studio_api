package api.clipboard.setData
{
	import api.clipboard.Clipboard;

	import api.events.clipboard.setData.SetDataEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Clipboard_setData.html Northcode Help Documentation
	*/
	public class SetData extends Clipboard
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var rtf:String = null;
		
		/**
		* Constructor for Clipboard.SetData()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Clipboard_setData.html Northcode Help Documentation
		*/
		public function SetData(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Clipboard_setData.html Northcode Help Documentation
		*/
		public function setData():void
		{
			switch( text )
			{
				case null:
					switch( rtf )
					{
						case null:
							missingData();
							break;
						default:
							ssCore.Clipboard.setData( {rtf:rtf} , {callback:actionComplete, errorSTR:"setDataError", code:"12003"} );
					}
					break;
				default:
					ssCore.Clipboard.setData( {text:text} , {callback:actionComplete, errorSTR:"setDataError", code:"12003"} );
			}
		}
	}
}