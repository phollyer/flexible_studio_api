package api.catalog.unload
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;

	[Bindable]
	public class Unload extends Catalog
	{
		public function Unload(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function unload():void
		{
			ssCore.Catalog.unload( {}
								  ,{callback:actionComplete, errorSTR:"unloadError", code:"17011"} );
		}
	}
}