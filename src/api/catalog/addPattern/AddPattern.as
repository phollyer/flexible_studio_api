package api.catalog.addPattern
{
	import api.catalog.Catalog;

	import api.events.catalog.addPattern.AddPatternEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>fieldName</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_FIELD_NAME
	*/
	[Event(name="missingFieldName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPattern" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_addPattern.html Northcode Help Documentation
	*/
	public class AddPattern extends Catalog
	{
		public static const EXACT:String = "Exact";
		public static const PARTIAL:String = "Partial";
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var exclusive:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>PARTIAL</code>
		*/
		public var matchType:String = PARTIAL;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var fieldName:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var pattern:String = null;
		
		/**
		* Constructor for Catalog.AddPattern()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_addPattern.html Northcode Help Documentation
		*/
		public function AddPattern(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param field
		*
		* @param queryPattern
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_addPattern.html Northcode Help Documentation
		*/
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