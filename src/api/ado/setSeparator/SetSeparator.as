package api.ado.setSeparator
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;

	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setSeparator.html Northcode Help Documentation
	 */
	public class SetSeparator extends Ado
	{
		// Optional
		public var separator:String = "\n";
		
		/**
		 * Constructor for Ado.SetSeparator()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setSeparator.html Northcode Help Documentation
		 */
		public function SetSeparator(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setSeparator.html Northcode Help Documentation
		 */
		public function setSeparator():void
		{
			ssCore.Ado.setSeparator( {separator:separator}
									,{callback:actionComplete, errorSTR:"setSeparatorError", code:"16023"} );
		}
	}
}