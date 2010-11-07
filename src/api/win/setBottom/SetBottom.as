package api.win.setBottom
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class SetBottom extends Win
	{
		// Optional
		public var flag:Boolean = true;
		
		public function SetBottom(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setBottom():void
		{
			ssCore.Win.setBottom( {flag:flag}
								 ,{callback:actionComplete, errorSTR:"setBottomError", code:"6019"} );
		}
	}
}