package api.win.showBorder
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class ShowBorder extends Win
	{
		// Optional
		public var flag:Boolean = true;
		
		public function ShowBorder(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showBorder():void
		{
			ssCore.Win.showBorder( {flag:flag}
								  ,{callback:actionComplete, errorSTR:"showBorderError", code:"6032"} );
		}
	}
}