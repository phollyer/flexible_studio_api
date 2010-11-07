package api.win.hide
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class Hide extends Win
	{
		public function Hide(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function hide():void
		{
			ssCore.Win.hide( {}
							,{callback:actionComplete, errorSTR:"hideError", code:"6007"} );
		}
	}
}