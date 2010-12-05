package api.ado.setSQL
{
	import api.ado.Ado;

	import api.events.ado.setSQL.SetSQLEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 * Provide the raw SQL to create a result set.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setSQL.html Northcode Help Documentation
	 */
	public class SetSQL extends Ado
	{
		// Optional
		public var sql:String = "";
		
		/**
		 * Constructor for Ado.SetSQL()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setSQL.html Northcode Help Documentation
		 */
		public function SetSQL(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Provide the raw SQL to create a result set.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setSQL.html Northcode Help Documentation
		 */
		public function setSQL():void
		{
			ssCore.Ado.setSQL( {sql:sql}
							  ,{callback:actionComplete, errorSTR:"setSQLError", code:"16024"} );
		}
	}
}