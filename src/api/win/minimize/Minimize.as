package api.win.minimize
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class Minimize extends Win
	{
		public function Minimize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function minimize():void
		{
			ssCore.Win.minimize( {}
								,{callback:actionComplete, errorSTR:"minimizeError", code:"6013"} );
		}
	}
}