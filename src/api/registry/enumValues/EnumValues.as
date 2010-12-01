package api.registry.enumValues
{
	import api.events.registry.enumValues.EnumValuesEvent;

	import api.registry.Registry;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>rootValue</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_ROOT_VALUE
	*/
	[Event(name="missingRootValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubValue" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.registry.enumValues.EnumValuesEvent.RESULT
	*/
	[Event(name="result", type="api.events.registry.enumValues.EnumValuesEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_enumValues.html Northcode Help Documentation
	*/
	public class EnumValues extends Registry
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
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var values:Array = null;
		
		/**
		* Constructor for Registry.EnumValues()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_enumValues.html Northcode Help Documentation
		*/
		public function EnumValues(target:IEventDispatcher=null)
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_enumValues.html Northcode Help Documentation
		*/
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

		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
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