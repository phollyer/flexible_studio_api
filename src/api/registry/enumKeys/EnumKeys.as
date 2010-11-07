package api.registry.enumKeys
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.registry.enumKeys.EnumKeysEvent;
	import api.registry.Registry;
	
	[Event(name="missingRootValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubValue" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.registry.enumKeys.EnumKeysEvent")]
	[Bindable]
	public class EnumKeys extends Registry
	{
		// Required
		public var rootKey:String = null;
		public var subKey:String = null;
		
		// Result
		public var subKeys:Array = null;
		
		public function EnumKeys(target:IEventDispatcher=null)
		{
			super(target);
		}
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

		override protected function sendResult( r:Object ):void
		{
			subKeys = r.result.split( CR );
			var e : EnumKeysEvent = new EnumKeysEvent( EnumKeysEvent.RESULT );
			e.subKeys = subKeys;
			dispatchEvent( e );
		}
	}
}