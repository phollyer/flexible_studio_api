package api.catalog.fields
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;
	
	import api.events.catalog.fields.FieldsEvent;

	[Event(name="result", type="api.events.catalog.fields.FieldsEvent")]
	[Bindable]
	public class Fields extends Catalog
	{
		// Result
		public var fieldList:Array = null;
		
		public function Fields(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function fields():void
		{
			ssCore.Catalog.fields( {}
								  ,{callback:actionComplete, errorSTR:"fieldsError", code:"17003"} );
		}
		override protected function sendResult( r:Object ):void
		{
			fieldList = r.result.split( TAB );
			var e : FieldsEvent = new FieldsEvent( FieldsEvent.RESULT );
			e.fieldList = fieldList;
			dispatchEvent( e );
		}
	}
}