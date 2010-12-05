package api.catalog.fields
{
	import api.catalog.Catalog;

	import api.events.catalog.fields.FieldsEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.catalog.fields.FieldsEvent.RESULT
	*/
	[Event(name="result", type="api.events.catalog.fields.FieldsEvent")]
	[Bindable]
	/**
	* Returns the header row (field list) from the catalog file.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_fields.html Northcode Help Documentation
	*/
	public class Fields extends Catalog
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var fieldList:Array = null;
		
		/**
		* Constructor for Catalog.Fields()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_fields.html Northcode Help Documentation
		*/
		public function Fields(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Returns the header row (field list) from the catalog file.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_fields.html Northcode Help Documentation
		*/
		public function fields():void
		{
			ssCore.Catalog.fields( {}
								  ,{callback:actionComplete, errorSTR:"fieldsError", code:"17003"} );
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
			fieldList = r.result.split( TAB );
			var e : FieldsEvent = new FieldsEvent( FieldsEvent.RESULT );
			e.fieldList = fieldList;
			dispatchEvent( e );
		}
	}
}