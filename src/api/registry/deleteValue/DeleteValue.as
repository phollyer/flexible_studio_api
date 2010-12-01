package api.registry.deleteValue
{
	import api.events.registry.deleteValue.DeleteValueEvent;

	import api.registry.Registry;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>rootValue</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_ROOT_VALUE
	*/
	[Event(name="missingRootValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingValueName" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_deleteValue.html Northcode Help Documentation
	*/
	public class DeleteValue extends Registry
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var rootKey:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var subKey:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var valueName:String = null;
		
		/**
		* Constructor for Registry.DeleteValue()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_deleteValue.html Northcode Help Documentation
		*/
		public function DeleteValue(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param rootKeySTR
		*
		* @param subKeySTR
		*
		* @param valueNameSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_deleteValue.html Northcode Help Documentation
		*/
		public function deleteValue( rootKeySTR:String = null , subKeySTR:String = null , valueNameSTR:String = null ):void
		{
			rootKey = compareStrings( rootKeySTR , rootKey );
			subKey = compareStrings( subKeySTR , subKey );
			valueName = compareStrings( valueNameSTR , valueName );
			
			switch( rootKey )
			{
				case null:
					missingRootValue();
					break;
				default:
					switch( subKey )
					{
						case null:
							missingSubValue();
							break;
						default:
							switch( valueName )
							{
								case null:
									missingValueName();
									break;
								default:
									ssCore.Registry.deleteValue( {rootKey:rootKey , subKey:subKey , valueName:valueName}
											                    ,{callback:actionComplete, errorSTR:"deleteValueError", code:"33001"} );
							}
					}
			}
		}


	}
}