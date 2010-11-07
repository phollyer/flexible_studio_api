package api.catalog.found
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;
	
	import api.events.catalog.found.FoundEvent;

	[Event(name="result", type="api.events.catalog.found.FoundEvent")]
	[Bindable]
	public class Found extends Catalog
	{
		// Result
		public var rowNumber:Number = 0;
		
		public function Found(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function found():void
		{
			ssCore.Catalog.found( {}
								 ,{callback:actionComplete, errorSTR:"foundError", code:"17005"} );
		}
		override protected function sendResult( r:Object ):void
		{
			rowNumber = Number( r.result );
			
			var e : FoundEvent = new FoundEvent( FoundEvent.RESULT );
			e.rowNumber = rowNumber;
			dispatchEvent( e );
		}
	}
}