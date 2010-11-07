package api.activeX.isRegistered
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	import api.events.activeX.isRegistered.IsRegisteredEvent;
	
	
	/**
	 * Dispatched when the call to the SWF Studio Method
	 * <code>ActiveX.isRegistered()</code> has completed successfully.
	 * 
	 * @eventType api.events.activeX.isRegistered.IsRegisteredEvent.RESULT
	 */	
	
	/**
	 * Dispatched when the Property <code>progID</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.isRegistered.IsRegisteredEvent.RESULT_PROG_ID
	 */
	
	/**
	 * Dispatched when the Results are ready.
	 * 
	 * @eventType api.events.activeX.isRegistered.IsRegisteredEvent.RESULT
	 */
	
	/**
	 * Dispatched when an Error has occured when trying to complete the SWF Studio Method.
	 * 
	 * @eventTYpe api.errors.ActiveXError.IS_REGISTERED_ERROR
	 */
	
	/**
	 * Check to see if the specified <code>progID</code> (Class Name) for the
	 * ActiveX Object matches an ActiveX Object installed on the local machine.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_isRegistered.html Northcode Help Documentation
	 */
	[Event(name="missingProgID" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.activeX.isRegistered.IsRegisteredEvent")]
	[Bindable]
	public class IsRegistered extends ActiveX
	{		
		/**
		 * Programmatic ID for the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var progID:String = null;
		
		/**
		 * RESULT. Flag to determine if the ActiveX Object is installed on the local machine.
		 * 
		 * @defaultValue false
		 */
		public var registered:Boolean = false;
		
		public function IsRegistered(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Check to see if the specified <code>progID</code> (Class Name) for the
	 	 * ActiveX Object matches an ActiveX Object installed on the local machine.
	 	 * 
	 	 * @param prodIDString Programmatic ID for the ActiveX Object.
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
		override protected function sendResult( r:Object ):void
		{
			registered = checkBoolean( r.result );
			var e : IsRegisteredEvent = new IsRegisteredEvent( IsRegisteredEvent.RESULT );
			e.registered = registered;
			dispatchEvent( e );
		}
	}
}