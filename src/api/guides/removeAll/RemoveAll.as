package api.guides.removeAll
{
	import flash.events.IEventDispatcher;
	import api.guides.Guides;

	[Bindable]
	public class RemoveAll extends Guides
	{
		public function RemoveAll(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function removeAll():void
		{
			ssCore.Guides.removeAll( {}
									,{callback:actionComplete, errorSTR:"removeAllError", code:"21001"} );
		}
	}
}