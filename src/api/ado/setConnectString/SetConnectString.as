package api.ado.setConnectString
{
	import api.ado.Ado;

	import api.events.ado.setConnectString.SetConnectStringEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>string</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_STRING
	 */
	[Event(name="missingString" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 * Provide an ADO connection string that identifies the data provider and the data source you want to use.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setConnectString.html Northcode Help Documentation
	 */
	public class SetConnectString extends Ado
	{
		// Required
		/**
		 * An ADO connection string.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var connectString:String = null;
		
		/**
		 * Constructor for Ado.SetConnectString()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setConnectString.html Northcode Help Documentation
		 */
		public function SetConnectString(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Provide an ADO connection string that identifies the data provider and the data source you want to use.
		 *
                 *
		 * @param adoConnectString
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setConnectString.html Northcode Help Documentation
		 */
		public function setConnectString( adoConnectString:String = null ):void
		{
			connectString = compareStrings( adoConnectString , connectString );
			switch( connectString )
			{
				case null:
					missingString();
					break;
				default:
					ssCore.Ado.setConnectString( {connectString:connectString}
												,{callback:actionComplete, errorSTR:"setConnectStringError", code:"16018"} );
			}
		}
	}
}