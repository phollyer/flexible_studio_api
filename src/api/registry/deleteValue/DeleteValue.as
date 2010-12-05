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
	* Delete the specified value from the registry.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_deleteValue.html Northcode Help Documentation
	*/
	public class DeleteValue extends Registry
	{
		// Required
		/**
		* The name of one of the main branches of the registry. Valid values include: HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_USERS, HKEY_LOCAL_MACHINE, HKEY_PERFORMANCE_DATA, HKEY_CURRENT_CONFIG, and HKEY_DYN_DATA.
		*
		* @defaultValue <code>null</code>
		*/
		public var rootKey:String = null;
		/**
		* The name of the key that contains the value to be deleted. This key must be a subkey of the rootKey.
		*
		* @defaultValue <code>null</code>
		*/
		public var subKey:String = null;
		/**
		* The name of the value to be deleted from the specified subkey.
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
		* Delete the specified value from the registry.
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