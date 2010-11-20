package api.win.startDrag
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class StartDrag extends Win
	{
		public function StartDrag(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function startDrag():void
		{
			ssCore.Win.startDrag( {}
								 ,{callback:actionComplete, errorSTR:"startDragError", code:"6036"} );
		}
	}
}