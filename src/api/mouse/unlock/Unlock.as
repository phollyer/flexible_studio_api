package api.mouse.unlock
{
	import flash.events.IEventDispatcher;
	import api.mouse.Mouse;

	[Bindable]
	public class Unlock extends Mouse
	{		
		public function Unlock(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function unlock():void
		{
			ssCore.Mouse.unlock( {}
							    ,{callback:actionComplete, errorSTR:"unlockError", code:"29009"} );
		}
	}
}