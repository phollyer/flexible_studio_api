package api.activeX.callMethod
{
	import api.activeX.ActiveX;

	import api.events.activeX.callMethod.CallMethodEvent;

	import flash.events.IEventDispatcher;	
	
	/**
	 * Dispatched if the Property <code>method</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.callMethod.CallMethodEvent.RESULT_METHOD
	 */
	/**
	 * Dispatched if the Property <code>method</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_METHOD
	 */
	[Event(name="missingMethod" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.callMethod.CallMethodEvent.RESULT_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Results are ready.
	 * 
	 * @eventType api.events.activeX.callMethod.CallMethodEvent.RESULT
	 */
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.activeX.callMethod.CallMethodEvent.RESULT
	 */
	[Event(name="result", type="api.events.activeX.callMethod.CallMethodEvent")]
	
	[Bindable]
	/**
	 * Calls a Method on an ActiveX Object.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_callMethod.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_callMethod.html Northcode Help Documentation
	 */
	public class CallMethod extends ActiveX
	{
		/**
		 * The Method on the ActiveX Object to call.
		 * 
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var method:String = null;
		
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * The data returned from the method called.
		 * 
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var returnData:Object = null;
		
		/**
		 * Constructor for ActiveX.CallMethod()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_callMethod.html Northcode Help Documentation
		 */
		public function CallMethod(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Call the Method on the ActiveX Object.
		 * 
		 * @param methodName The Method on the ActiveX Object to call. Corresponds to <code>method</code>.
		 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object. Corresponds to <code>object</code>
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_callMethod.html Northcode Help Documentation
		 */
		/**
		 *
		 *
                 *
		 * @param methodName
                 *
		 * @param activeXObject
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_callMethod.html Northcode Help Documentation
		 */
		public function callMethod( methodName:String = null , activeXObject:String = null ):void
		{
			method = compareStrings( methodName , method );
			object = compareStrings( activeXObject , object );
			switch( method )
			{
				case null:
					missingMethod();
					break;
				default:
					switch( object )
					{
						case null:
							missingObject();
							break;
						default:
							ssCore.ActiveX.callMethod( {method:method , object:object}
													  ,{callback:actionComplete, errorSTR:"callMethodError", code:"15002"} );
					}
			}
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
			returnData = r.result;
			var e : CallMethodEvent = new CallMethodEvent( CallMethodEvent.RESULT );
			e.returnData = returnData;
			dispatchEvent( e );
		}
	}
}