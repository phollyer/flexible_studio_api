package api.ado.setTable
{
	import api.ado.Ado;

	import api.events.ado.setTable.SetTableEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 * Provide the name of the table that ADO.Open will use.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setTable.html Northcode Help Documentation
	 */
	public class SetTable extends Ado
	{
		// Optional
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var name:String = null;
		
		/**
		 * Constructor for Ado.SetTable()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setTable.html Northcode Help Documentation
		 */
		public function SetTable(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Provide the name of the table that ADO.Open will use.
		 *
                 *
		 * @param tableName
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setTable.html Northcode Help Documentation
		 */
		public function setTable( tableName:String = null ):void
		{
			name = compareStrings( tableName , name );
			switch( name )
			{
				case "":
				case null:
					ssCore.Ado.setTable( {}
										,{callback:actionComplete, errorSTR:"setTableError", code:"16025"} );
					break;
				default:
					ssCore.Ado.setTable( {name:name}
										,{callback:actionComplete, errorSTR:"setTableError", code:"16025"} );
			}
		}
	}
}