package api.activeX.isRegistered
{
	import api.activeX.ActiveX;

	import api.events.activeX.isRegistered.IsRegisteredEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>progID</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_PROG_ID
	 */
	[Event(name="missingProgID" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.activeX.isRegistered.IsRegisteredEvent.RESULT
	 */
	[Event(name="result", type="api.events.activeX.isRegistered.IsRegisteredEvent")]
	
	[Bindable]
	/**
	 * Determines whether a specified progId represents an installed ActiveX control.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_isRegistered.html Northcode Help Documentation
	 */
	public class IsRegistered extends ActiveX
	{		
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var progID:String = null;
		
		/**
		 * 
		 *
		 * @defaultValue <code>false</code>
		 */
		public var registered:Boolean = false;
		
		/**
		 * Constructor for ActiveX.IsRegistered()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_isRegistered.html Northcode Help Documentation
		 */
		public function IsRegistered(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Determines whether a specified progId represents an installed ActiveX control.
		 *
                 *
		 * @param progIDString
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_isRegistered.html Northcode Help Documentation
		 */
		public function isRegistered( progIDString:String = null ):void
		{
			progID = compareStrings( progIDString , progID );
			switch( progID )
			{
				case null:
					missingProgID();
					break;
				default:
					ssCore.ActiveX.isRegistered( {progId:progID}
												,{callback:actionComplete, errorSTR:"isRegisteredError", code:"15007"} );
			}
		}

		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			registered = checkBoolean( r.result );
			var e : IsRegisteredEvent = new IsRegisteredEvent( IsRegisteredEvent.RESULT );
			e.registered = registered;
			dispatchEvent( e );
		}
	}
}