package api.catalog.find
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;

	[Bindable]
	public class Find extends Catalog
	{
		public function Find(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function find():void
		{
			ssCore.Catalog.find( {}
								,{callback:actionComplete, errorSTR:"findError", code:"17004"} );
		}
	}
}