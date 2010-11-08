package api.ado.setOrderBy
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;

	[Bindable]
	public class SetOrderBy extends Ado
	{
		// Optional
		public var order:Array = null;
		
		public function SetOrderBy(target:IEventDispatcher=null)
		{
			super(target);
		}
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