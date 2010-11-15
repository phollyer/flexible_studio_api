package api.ado.setConnectString
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	[Event(name="missingString" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setConnectString.html Northcode Help Documentation
	 */
	public class SetConnectString extends Ado
	{
		// Required
		/**
		 * 
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
		 *
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