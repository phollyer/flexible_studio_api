package api.catalog.reset
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;

	[Bindable]
	public class Reset extends Catalog
	{
		public function Reset(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function reset():void
		{
			ssCore.Catalog.reset( {}
								 ,{callback:actionComplete, errorSTR:"resetError", code:"17008"} );
		}
	}
}