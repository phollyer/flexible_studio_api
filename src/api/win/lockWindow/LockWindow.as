package api.win.lockWindow
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class LockWindow extends Win
	{
		// Optional
		public var flag:Boolean = true;
		
		public function LockWindow(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function lockWindow():void
		{
			ssCore.Win.lockWindow( {flag:flag}
								  ,{callback:actionComplete, errorSTR:"lockWindowError", code:"6011"} );
		}
	}
}