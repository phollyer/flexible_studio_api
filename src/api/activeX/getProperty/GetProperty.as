package api.activeX.getProperty
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	import api.events.activeX.getProperty.GetPropertyEvent;
	
	
	/**
	 * Dispatched when the call to the SWF Studio Method
	 * <code>ActiveX.getProperty()</code> has completed successfully.
	 * 
	 * @eventType api.events.activeX.getProperty.GetPropertyEvent.RESULT
	 */
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.getProperty.GetPropertyEvent.RESULT_OBJECT
	 */
	
	/**
	 * Dispatched when the Property <code>progID</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.getProperty.GetPropertyEvent.RESULT_PROG_ID
	 */
	
	/**
	 * Dispatched when the Results are ready.
	 * 
	 * @eventType api.events.activeX.getProperty.GetPropertyEvent.RESULT
	 */
	
	/**
	 * Dispatched when an Error has occured when trying to complete the SWF Studio Method.
	 * 
	 * @eventTYpe api.errors.ActiveXError.GET_PROPERTY_ERROR
	 */
	
	/**
	 * Get a value for a Property of an ActiveX Object that you have embedded 
	 * into your Application.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_getProperty.html Northcode Help Documentation
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	[Event(name="missingProgID" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.activeX.getProperty.GetPropertyEvent")]
	[Bindable]
	public class GetProperty extends ActiveX
	{
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * The Property on the ActiveX Object that you are retrieving.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var property:String = null;
		
		/**
		 * RESULT. The Value of the Property retrieved.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var value:Object = null;
		
		public function GetProperty(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Get a value for a Property of an ActiveX Object that you have embedded 
	 	 * into your Application.
	 	 * 
	 	 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * @param prop The Property on the ActiveX Object that you are retrieving.
	 	 * 
	 	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_getProperty.html Northcode Help Documentation
	 	 */
		public function getProperty( activeXObject:String , prop:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			property = compareStrings( prop , property );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					switch( property )
					{
						case null:
							missingProperty();
							break;
						default:
							getProp();
					}
			}
		}
		private function getProp():void
		{
			ssCore.ActiveX.getProperty( {object:object , property:property}
									   ,{callback:actionComplete, errorSTR:"getPropertyError", code:"15006"} );
		}

		override protected function sendResult( r:Object ):void
		{
			value = r.result;
			var e : GetPropertyEvent = new GetPropertyEvent( GetPropertyEvent.RESULT );
			e.propertyVal = value;
			dispatchEvent( e );
		}
	}
}