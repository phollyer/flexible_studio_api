package api.ado.getVersion
{
	import api.ado.Ado;

	import api.events.ado.getVersion.GetVersionEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.GetVersion.Event.RESULT
	 */
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.getVersion.GetVersionEvent.RESULT
	 */
	[Event(name="result", type="api.events.ado.getVersion.GetVersionEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getVersion.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getVersion.html Northcode Help Documentation
	 */
	public class GetVersion extends Ado
	{
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var version:String = null;
		
		/**
		 * Constructor for Ado.GetVersion()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getVersion.html Northcode Help Documentation
		 */
		/**
		 * Constructor for Ado.GetVersion()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getVersion.html Northcode Help Documentation
		 */
		public function GetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getVersion.html Northcode Help Documentation
		 */
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getVersion.html Northcode Help Documentation
		 */
		public function getVersion():void
		{
			ssCore.Ado.getVersion( {} , {callback:actionComplete, errorSTR:"getVersionError", code:"16008"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			version = r.result;
			
			var e : GetVersionEvent = new GetVersionEvent( GetVersionEvent.RESULT );
			e.version = version;
			dispatchEvent( e );
		}
	}
}