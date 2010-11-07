package api.win.setFocus
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class SetFocus extends Win
	{
		// Optional
		public var hwnd:String = null;
		
		public function SetFocus(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setFocus():void
		{
			switch( hwnd )
			{
				case null:
					ssCore.Win.setFocus( {}
										,{callback:actionComplete, errorSTR:"setFocusError", code:"6023"} );
					break;
				default:
					ssCore.Win.setFocus( {hwnd:hwnd}
										,{callback:actionComplete, errorSTR:"setFocusError", code:"6023"} );
			}
		}
	}
}