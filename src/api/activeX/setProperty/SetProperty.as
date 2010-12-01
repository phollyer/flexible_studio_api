package api.activeX.setProperty
{
	import api.activeX.ActiveX;

	import api.events.activeX.setProperty.SetPropertyEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Property <code>property</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setProperty.SetPropertyEvent.RESULT_PROPERTY
	 */
	[Event(name="missingPorperty" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Property <code>value</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setProperty.SetPropertyEvent.RESULT_VALUE
	 */
	[Event(name="missingValue" , type="api.events.SWFStudioEvent")]
	
	[Event(name="missingProperty", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setProperty.html Northcode Help Documentation
	 */
	public class SetProperty extends ActiveX
	{
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
		public var property:String = null;
		
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var value:String = null;
		
		/**
		 * Constructor for ActiveX.SetProperty()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setProperty.html Northcode Help Documentation
		 */
		public function SetProperty(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 *
		 *
                 *
		 * @param activeXObject
                 *
		 * @param prop
                 *
		 * @param val
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
									ssCore.ActiveX.setProperty( {object:object , property:property , value:value}
															   ,{callback:actionComplete, errorSTR:"setPropertyError", code:"15012"} );
							}
					}
			}
		}
	}
}