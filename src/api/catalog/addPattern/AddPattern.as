package api.catalog.addPattern
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;
	
	[Event(name="missingFieldName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPattern" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AddPattern extends Catalog
	{
		public static const EXACT:String = "Exact";
		public static const PARTIAL:String = "Partial";
		
		// Optional
		public var exclusive:Boolean = false;
		public var matchType:String = PARTIAL;
		
		// Required
		public var fieldName:String = null;
		public var pattern:String = null;
		
		public function AddPattern(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function addPattern( field:String = null , queryPattern:String = null ):void
		{
			fieldName = compareStrings( field , fieldName );
			pattern = compareStrings( queryPattern , pattern );
			switch( fieldName )
			{
				case null:
					missingFieldName();
					break;
				default:
					switch( pattern )
					{
						case null:
							missingPattern();
							break;
						default:
							setPattern();
					}
			}
		}
		private function setPattern():void
		{
			ssCore.Catalog.addPattern( {fieldName:fieldName , pattern:pattern , exclusive:exclusive , matchType:matchType}
									  ,{callback:actionComplete, errorSTR:"addPatternError", code:"17000"} );
		}

	}
}