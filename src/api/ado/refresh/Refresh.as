package api.ado.refresh
{
	import api.ado.Ado;

	import api.events.ado.refresh.RefreshEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_refresh.html Northcode Help Documentation
	 */
	public class Refresh extends Ado
	{
		/**
		 * Constructor for Ado.Refresh()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_refresh.html Northcode Help Documentation
		 */
		public function Refresh(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_refresh.html Northcode Help Documentation
		 */
		public function refresh():void
		{
			ssCore.Ado.refresh( {} , {callback:actionComplete, errorSTR:"refreshError", code:"16017"} );
		}
	}
}