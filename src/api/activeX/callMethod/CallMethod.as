package api.activeX.callMethod
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	import api.events.activeX.callMethod.CallMethodEvent;	
	
	/**
	 * Dispatched when the call to the SWF Studio Method
	 * <code>ActiveX.callMethod()</code> has completed successfully.
	 * 
	 * @eventType api.events.activeX.callMethod.CallMethodEvent.RESULT
	 */
	
	/**
	 * Dispatched if the Property <code>method</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.callMethod.CallMethodEvent.RESULT_METHOD
	 */
	
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.callMethod.CallMethodEvent.RESULT_OBJECT
	 */
	
	/**
	 * Dispatched when the Results are ready.
	 * 
	 * @eventType api.events.activeX.callMethod.CallMethodEvent.RESULT
	 */
	
	/**
	 * Dispatched when an Error has occured when trying to complete the SWF Studio Method.
	 * 
	 * @eventTYpe api.errors.ActiveXError.CALL_METHOD_ERROR
	 */
	
	/**
	 * Calls a Method on an ActiveX Object.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_callMethod.html Northcode Help Documentation
	 */
	[Event(name="missingMethod" , type="api.events.SWFStudioEvent")]
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.activeX.callMethod.CallMethodEvent")]
	[Bindable]
	public class CallMethod extends ActiveX
	{
		/**
		 * The Method on the ActiveX Object to call.
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
		public var object:String = null;
		
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
							setMethod();
					}
			}
		}

		override protected function sendResult( r:Object ):void
		{
			var e : CallMethodEvent = new CallMethodEvent( CallMethodEvent.RESULT );
			e.returnData = r.result;
			dispatchEvent( e );
		}
		private function setMethod():void
		{
			ssCore.ActiveX.callMethod( {method:method , object:object}
									  ,{callback:actionComplete, errorSTR:"callMethodError", code:"15002"} );
		}
	}
}