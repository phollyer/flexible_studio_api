package api.catalog.maxRows
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;

	[Bindable]
	public class MaxRows extends Catalog
	{
		// Optional
		public var number:Number = 100;
		
		public function MaxRows(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function maxRows():void
		{
			ssCore.Catalog.maxRows( {number:number}
								   ,{callback:actionComplete, errorSTR:"maxRowsError", code:"17007"} );
		}
	}
}