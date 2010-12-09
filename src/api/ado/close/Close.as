package api.ado.close
{
	import api.ado.Ado;

	import api.events.ado.close.CloseEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	 * Close the table.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_close.html Northcode Help Documentation
	 */
	public class Close extends Ado
	{
		/**
		 * Constructor for Ado.Close()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_close.html Northcode Help Documentation
		 */
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Close the table.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_close.html Northcode Help Documentation
		 */
		public function close():void
		{
			ssCore.Ado.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"16000"} );
		}
	}
}