package api.ado.setWhere
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;

	[Bindable]
	/**
	 *
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
		 *
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