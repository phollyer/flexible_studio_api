package api.win.maximize
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class Maximize extends Win
	{
		public function Maximize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function maximize():void
		{
			ssCore.Win.maximize( {}
								,{callback:actionComplete, errorSTR:"maximizeError", code:"6012"} );
		}
	}
}