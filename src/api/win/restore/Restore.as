package api.win.restore
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class Restore extends Win
	{
		public function Restore(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function restore():void
		{
			ssCore.Win.restore( {}
							   ,{callback:actionComplete, errorSTR:"restoreError", code:"6014"} );
		}
	}
}