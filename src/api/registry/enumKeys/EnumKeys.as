package api.registry.enumKeys
{
	import api.events.registry.enumKeys.EnumKeysEvent;

	import api.registry.Registry;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>rootValue</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_ROOT_VALUE
	*/
	[Event(name="missingRootValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubValue" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.registry.enumKeys.EnumKeysEvent.RESULT
	*/
	[Event(name="result", type="api.events.registry.enumKeys.EnumKeysEvent")]
	[Bindable]
	/**
	* Retrieve a list of all the child keys of the specified subkey.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_enumKeys.html Northcode Help Documentation
	*/
	public class EnumKeys extends Registry
	{
		// Required
		/**
		* The name of one of the main branches of the registry. Valid values include: HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_USERS, HKEY_LOCAL_MACHINE, HKEY_PERFORMANCE_DATA, HKEY_CURRENT_CONFIG, and HKEY_DYN_DATA.
		*
		* @defaultValue <code>null</code>
		*/
		public var rootKey:String = null;
		/**
		* The name of the key whose children are to be enumerated. This key must be a subkey of the rootKey.
		*
		* @defaultValue <code>null</code>
		*/
		public var subKey:String = null;
		
		// Result
		/**
		* The name of the key whose children are to be enumerated. This key must be a subkey of the rootKey.
		*
		* @defaultValue <code>null</code>
		*/
		public var subKeys:Array = null;
		
		/**
		* Constructor for Registry.EnumKeys()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_enumKeys.html Northcode Help Documentation
		*/
		public function EnumKeys(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieve a list of all the child keys of the specified subkey.
		*
		*
		* @param rootKeySTR
		*
		* @param subKeySTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_enumKeys.html Northcode Help Documentation
		*/
		public function enumKeys( rootKeySTR:String = null , subKeySTR:String = null ):void
		{
			rootKey = compareStrings( rootKeySTR , rootKey );
			subKey = compareStrings( subKeySTR , subKey );
			
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
							ssCore.Registry.enumKeys( {rootKey:rootKey , subKey:subKey}
								                     ,{callback:actionComplete, errorSTR:"enumKeysError", code:"33002"} );
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
			subKeys = r.result.split( CR );
			var e : EnumKeysEvent = new EnumKeysEvent( EnumKeysEvent.RESULT );
			e.subKeys = subKeys;
			dispatchEvent( e );
		}
	}
}