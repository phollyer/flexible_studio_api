package api.registry.deleteKey
{
	import api.events.registry.deleteKey.DeleteKeyEvent;

	import api.registry.Registry;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>rootKey</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_ROOT_KEY
	*/
	[Event(name="missingRootKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubKey" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Delete the specified key from the registry. The key, all its subkeys and all values will be removed.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_deleteKey.html Northcode Help Documentation
	*/
	public class DeleteKey extends Registry
	{
		// Required
		/**
		* The name of one of the main branches of the registry. Valid values include: HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_USERS, HKEY_LOCAL_MACHINE, HKEY_PERFORMANCE_DATA, HKEY_CURRENT_CONFIG, and HKEY_DYN_DATA.
		*
		* @defaultValue <code>null</code>
		*/
		public var rootKey:String = null;
		/**
		* The name of the key to be deleted. This key must be a subkey of the rootKey.
		*
		* @defaultValue <code>null</code>
		*/
		public var subKey:String = null;
		
		/**
		* Constructor for Registry.DeleteKey()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_deleteKey.html Northcode Help Documentation
		*/
		public function DeleteKey(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Delete the specified key from the registry. The key, all its subkeys and all values will be removed.
		*
		*
		* @param rootKeySTR
		*
		* @param subKeySTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_deleteKey.html Northcode Help Documentation
		*/
		public function deleteKey( rootKeySTR:String = null , subKeySTR:String = null ):void
		{
			rootKey = compareStrings( rootKeySTR , rootKey );
			subKey = compareStrings( subKeySTR , subKey );
			
			switch( rootKey )
			{
				case null:
					missingRootKey();
					break;
				default:
					switch( subKey )
					{
						case null:
							missingSubKey();
							break;
						default:
							ssCore.Registry.deleteKey( {rootKey:rootKey , subKey:subKey}
													  ,{callback:actionComplete, errorSTR:"deleteKeyError", code:"33000"} );
					}
			}
		}

	}
}