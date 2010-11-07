package api.activeX.setProperty
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	
	/**
	 * Dispatched when the call to the SWF Studio Method
	 * <code>ActiveX.setProperty()</code> has completed successfully.
	 * 
	 * @eventType api.events.activeX.setProperty.SetPropertyEvent.RESULT
	 */
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setProperty.SetPropertyEvent.RESULT_OBJECT
	 */
	
	/**
	 * Dispatched when the Property <code>property</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setProperty.SetPropertyEvent.RESULT_PROPERTY
	 */
	
	/**
	 * Dispatched when the Property <code>value</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setProperty.SetPropertyEvent.RESULT_VALUE
	 */
	
	/**
	 * Dispatched when an Error has occured when trying to complete the SWF Studio Method.
	 * 
	 * @eventTYpe api.errors.ActiveXError.SET_PROPERTY_ERROR
	 */
	
	/**
	 * Set a Property of the ActiveX Object.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setProperty.html Northcode Help Documentation
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPorperty" , type="api.events.SWFStudioEvent")]
	[Event(name="missingValue" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetProperty extends ActiveX
	{
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * The Property of the ActiveX Object that you want to set.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var property:String = null;
		
		/**
		 * The Value of the Property being set.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var value:String = null;
		
		public function SetProperty(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Set a Property of the ActiveX Object.
		 * 
		 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * @param prop The Property of the ActiveX Object that you want to set.
		 * @param val The Value of the Property being set.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setProperty.html Northcode Help Documentation
		 */
		public function setProperty( activeXObject:String = null , prop:String = null , val:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			property = compareStrings( prop , property );
			value = compareStrings( val , value );
			checkValues();
		}
		private function checkValues():void
		{
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
							switch( value )
							{ 
								case null:
									missingValue();
									break;
								default:
									setProp();
							}
					}
			}
		}
		private function setProp():void
		{
			ssCore.ActiveX.setProperty( {object:object , property:property , value:value}
									   ,{callback:actionComplete, errorSTR:"setPropertyError", code:"15012"} );
		}


	}
}