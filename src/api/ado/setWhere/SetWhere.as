package api.ado.setWhere
{
	import api.ado.Ado;

	import api.events.ado.setWhere.SetWhereEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 * Provide the SQL WHERE clause that will limit your view of the open table.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setWhere.html Northcode Help Documentation
	 */
	public class SetWhere extends Ado
	{
		// Optional
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var clause:String = null;
		
		/**
		 * Constructor for Ado.SetWhere()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setWhere.html Northcode Help Documentation
		 */
		public function SetWhere(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Provide the SQL WHERE clause that will limit your view of the open table.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setWhere.html Northcode Help Documentation
		 */
		public function setWhere():void
		{
			switch( clause )
			{
				case "":
				case null:
					ssCore.Ado.setWhere( {}
										,{callback:actionComplete, errorSTR:"setWhereError", code:"16026"} );
					break;
				default:
					ssCore.Ado.setWhere( {clause:clause}
										,{callback:actionComplete, errorSTR:"setWhereError", code:"16026"} );
			}
		}
	}
}