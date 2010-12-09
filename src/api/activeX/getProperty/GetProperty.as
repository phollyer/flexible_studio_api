package api.activeX.getProperty
{
	import api.activeX.ActiveX;

	import api.events.activeX.getProperty.GetPropertyEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Property <code>progID</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.getProperty.GetPropertyEvent.RESULT_PROG_ID
	 */
	[Event(name="missingProgID" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.activeX.getProperty.GetPropertyEvent.RESULT
	 */
	[Event(name="result", type="api.events.activeX.getProperty.GetPropertyEvent")]
	
	[Event(name="missingProperty", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 * Retrieve the value of a named property of an ActiveX object.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_getProperty.html Northcode Help Documentation
	 */
	public class GetProperty extends ActiveX
	{
		/**
		 * The name of the ActiveX object used in the call to createObject.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * The name of the propety to retrieve.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var property:String = null;
		
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var value:Object = null;
		
		/**
		 * Constructor for ActiveX.GetProperty()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_getProperty.html Northcode Help Documentation
		 */
		public function GetProperty(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Retrieve the value of a named property of an ActiveX object.
		 *
                 *
		 * @param activeXObject
                 *
		 * @param prop
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
							ssCore.ActiveX.getProperty( {object:object , property:property}
													   ,{callback:actionComplete, errorSTR:"getPropertyError", code:"15006"} );
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
			value = r.result;
			var e : GetPropertyEvent = new GetPropertyEvent( GetPropertyEvent.RESULT );
			e.propertyVal = value;
			dispatchEvent( e );
		}
	}
}