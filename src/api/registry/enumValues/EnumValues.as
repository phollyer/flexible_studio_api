package api.registry.enumValues
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.registry.enumValues.EnumValuesEvent;
	import api.registry.Registry;
	
	[Event(name="missingRootValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubValue" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.registry.enumValues.EnumValuesEvent")]
	[Bindable]
	public class EnumValues extends Registry
	{
		// Required
		public var rootKey:String = null;
		public var subKey:String = null;
		
		// Result
		public var values:Array = null;
		
		public function EnumValues(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function enumValues( rootKeySTR:String = null , subKeySTR:String = null ):void
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
							ssCore.Registry.enumValues( {rootKey:rootKey , subKey:subKey}
								                       ,{callback:actionComplete, errorSTR:"enumValuesError", code:"33003"} );
					}
			}
		}

		override protected function sendResult( r:Object ):void
		{
			var __a:Array = r.result.split( CR );
			values = new Array();
			for( var i:int = 0 ; i < __a.length ; i++ )
			{
				var __b:Array = __a[ i ].split( TAB );
				//values
			}
				
			
			var e : EnumValuesEvent = new EnumValuesEvent( EnumValuesEvent.RESULT );
			e.values = values;
			dispatchEvent( e );
		}
	}
}