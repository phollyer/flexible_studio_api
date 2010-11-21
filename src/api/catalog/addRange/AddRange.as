package api.catalog.addRange
{
	import api.catalog.Catalog;

	import api.events.catalog.addRange.AddRangeEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>fieldName</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_FIELD_NAME
	*/
	[Event(name="missingFieldName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHighValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingLowValue" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_addRange.html Northcode Help Documentation
	*/
	public class AddRange extends Catalog
	{
		public static const NUM_RANGE:String = "NUMRange";
		public static const TEXT_RANGE:String = "TXTRange";
		
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
		* @defaultValue <code>TEXT_RANGE</code>
		*/
		public var matchType:String = TEXT_RANGE;
		
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
		public var highValue:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var lowValue:String = null;
		
		/**
		* Constructor for Catalog.AddRange()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_addRange.html Northcode Help Documentation
		*/
		public function AddRange(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param field
		*
		* @param high
		*
		* @param low
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_addRange.html Northcode Help Documentation
		*/
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