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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_deleteKey.html Northcode Help Documentation
	*/
	public class DeleteKey extends Registry
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
		* Constructor for Registry.DeleteKey()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_deleteKey.html Northcode Help Documentation
		*/
		public function DeleteKey(target:IEventDispatcher=null)
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