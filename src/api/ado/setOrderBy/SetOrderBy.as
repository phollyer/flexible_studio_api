package api.ado.setOrderBy
{
	import api.ado.Ado;

	import api.events.ado.setOrderBy.SetOrderByEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setOrderBy.html Northcode Help Documentation
	*/
	public class SetOrderBy extends Ado
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var order:Array = null;
		
		/**
		* Constructor for Ado.SetOrderBy()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setOrderBy.html Northcode Help Documentation
		*/
		public function SetOrderBy(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setOrderBy.html Northcode Help Documentation
		*/
		public function setOrderBy():void
		{
			switch( order.length > 0 )
			{
				case false:
					ssCore.Ado.setOrderBy( {}
										  ,{callback:actionComplete, errorSTR:"setOrderByError", code:"16021"} );
					break;
				case true:
					var __s:String = order.join( "," );
					ssCore.Ado.setOrderBy( {order:order}
										  ,{callback:actionComplete, errorSTR:"setOrderByError", code:"16021"} );
			}
		}
	}
}