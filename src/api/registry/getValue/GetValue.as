package api.registry.getValue
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.registry.getValue.GetValueEvent;
	import api.registry.Registry;
	
	[Event(name="missingRootValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingValueName" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.registry.getValue.GetValueEvent")]
	[Bindable]
	public class GetValue extends Registry
	{
		// Required
		public var rootKey:String = null;
		public var subKey:String = null;
		public var valueName:String = null;
		
		// Results
		public var dataType:Object = null;
		public var value:String = null;
		
		public function GetValue(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getValue( rootKeySTR:String = null , subKeySTR:String = null , valueNameSTR:String = null ):void
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
									ssCore.Registry.getValue( {rootKey:rootKey , subKey:subKey , valueName:valueName}
											                    ,{callback:actionComplete, errorSTR:"getValueError", code:"33004"} );
							}
					}
			}
		}


		override protected function sendResult( r:Object ):void
		{
			dataType = r.type;
			value = r.result;
			
			var e : GetValueEvent = new GetValueEvent( GetValueEvent.RESULT );
			e.dataType = dataType;
			e.value = value;
			dispatchEvent( e );
		}
	}
}