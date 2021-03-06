package api.ado.setFieldList
{
	import api.ado.Ado;

	import api.events.ado.setFieldList.SetFieldListEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	 * Set the field list that will be used to define the columns in the open table.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setFieldList.html Northcode Help Documentation
	 */
	public class SetFieldList extends Ado
	{
		// Optional
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var fieldList:Array = null;
		
		/**
		 * Constructor for Ado.SetFieldList()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setFieldList.html Northcode Help Documentation
		 */
		public function SetFieldList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Set the field list that will be used to define the columns in the open table.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setFieldList.html Northcode Help Documentation
		 */
		public function setFieldList():void
		{
			switch( fieldList.length > 0 )
			{
				case false:
					ssCore.Ado.setFieldList( {}
											,{callback:actionComplete, errorSTR:"setFieldListError", code:"16020"} );
					break;
				case true:
					var __s:String = fieldList.join( "," );
					ssCore.Ado.setFieldList( {fieldList:__s}
											,{callback:actionComplete, errorSTR:"setFieldListError", code:"16020"} );
			}
		}
	}
}