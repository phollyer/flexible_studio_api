package api.registry.deleteKey
{
	import flash.events.IEventDispatcher;
	import api.registry.Registry;
	
	[Event(name="missingRootKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubKey" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class DeleteKey extends Registry
	{
		// Required
		public var rootKey:String = null;
		public var subKey:String = null;
		
		public function DeleteKey(target:IEventDispatcher=null)
		{
			super(target);
		}
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