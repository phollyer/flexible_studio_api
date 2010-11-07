package api.win.lockAspectRatio
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class LockAspectRatio extends Win
	{
		// Optional
		public var flag:Boolean = true;
		
		public function LockAspectRatio(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function lockAspectRatio():void
		{
			ssCore.Win.lockAspectRatio( {flag:flag}
								   	   ,{callback:actionComplete, errorSTR:"lockAspectRatioError", code:"6008"} );
		}
	}
}