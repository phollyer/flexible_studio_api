package api.registry.deleteValue
{
	import flash.events.IEventDispatcher;
	import api.registry.Registry;
	
	[Event(name="missingRootValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingValueName" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class DeleteValue extends Registry
	{
		// Required
		public var rootKey:String = null;
		public var subKey:String = null;
		public var valueName:String = null;
		
		public function DeleteValue(target:IEventDispatcher=null)
		{
			super(target);
		}
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