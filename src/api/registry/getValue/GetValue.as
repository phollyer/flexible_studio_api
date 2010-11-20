package api.registry.getValue
{
	import api.events.registry.getValue.GetValueEvent;

	import api.registry.Registry;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>rootValue</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_ROOT_VALUE
	*/
	[Event(name="missingRootValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSubValue" , type="api.events.SWFStudioEvent")]
	[Event(name="missingValueName" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.registry.getValue.GetValueEvent.RESULT
	*/
	[Event(name="result", type="api.events.registry.getValue.GetValueEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_getValue.html Northcode Help Documentation
	*/
	public class GetValue extends Registry
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
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var valueName:String = null;
		
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var dataType:Object = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var value:String = null;
		
		/**
		* Constructor for Registry.GetValue()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_getValue.html Northcode Help Documentation
		*/
		public function GetValue(target:IEventDispatcher=null)
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
		* @param valueNameSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_getValue.html Northcode Help Documentation
		*/
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


		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
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