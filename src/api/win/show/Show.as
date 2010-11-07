package api.win.show
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class Show extends Win
	{
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			ssCore.Win.show( {}
							,{callback:actionComplete, errorSTR:"showError", code:"6031"} );
		}
	}
}