package api.ado.setFieldList
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	[Bindable]
	/**
	 *
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
		 *
		 *
                 *
		 * @param fieldList
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