package api.activeX.callMethod
{
	import api.activeX.ActiveX;

	import api.events.activeX.callMethod.CallMethodEvent;

	import flash.events.IEventDispatcher;	
	
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
	[Event(name="result", type="api.events.activeX.callMethod.CallMethodEvent")]
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_callMethod.html Northcode Help Documentation
	*/
	public class CallMethod extends ActiveX
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var method:String = null;
		
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var object:String = null;
		
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
		override protected function sendResult( r:Object ):void
		{
			returnData = r.result;
			var e : CallMethodEvent = new CallMethodEvent( CallMethodEvent.RESULT );
			e.returnData = returnData;
			dispatchEvent( e );
		}
	}
}