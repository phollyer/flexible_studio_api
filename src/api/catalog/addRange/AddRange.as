package api.catalog.addRange
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;

	[Event(name="missingFieldName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHighValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingLowValue" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AddRange extends Catalog
	{
		public static const NUM_RANGE:String = "NUMRange";
		public static const TEXT_RANGE:String = "TXTRange";
		
		// Optional
		public var exclusive:Boolean = false;
		public var matchType:String = TEXT_RANGE;
		
		// Required
		public var fieldName:String = null;
		public var highValue:String = null;
		public var lowValue:String = null;
		
		public function AddRange(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function addRange( field:String = null , high:String = null , low:String = null ):void
		{
			fieldName = compareStrings( field , fieldName );
			highValue = compareStrings( high , highValue );
			lowValue = compareStrings( low , lowValue );
			
			switch( fieldName )
			{
				case null:
					missingFieldName();
					break;
				default:
					switch( highValue )
					{
						case null:
							missingHighValue();
							break;
						default:
							switch( lowValue )
							{
								case null:
									missingLowValue();
									break;
								default:
									setRange();
							}
					}
			}
		}
		private function setRange():void
		{
			ssCore.Catalog.addRange( {fieldName:fieldName , highValue:highValue , lowValue:lowValue , exclusive:exclusive , matchType:matchType}
									,{callback:actionComplete, errorSTR:"addRangeError", code:"17001"} );
		}


	}
}