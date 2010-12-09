package api.ado.setDelimiter
{
	import api.ado.Ado;

	import api.events.ado.setDelimiter.SetDelimiterEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	 * Select the field delimiter used with the DLM row format.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setDelimiter.html Northcode Help Documentation
	 */
	public class SetDelimiter extends Ado
	{
		// Optional
		public var delimiter:String = "|";
		
		/**
		 * Constructor for Ado.SetDelimiter()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setDelimiter.html Northcode Help Documentation
		 */
		public function SetDelimiter(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Select the field delimiter used with the DLM row format.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setDelimiter.html Northcode Help Documentation
		 */
		public function setDelimiter():void
		{
			ssCore.Ado.setDelimiter( {delimiter:delimiter}
									,{callback:actionComplete, errorSTR:"setDelimiterError", code:"16019"} );
		}
	}
}