package api.mouse.lock
{
	import flash.events.IEventDispatcher;
	import api.mouse.Mouse;

	[Bindable]
	public class Lock extends Mouse
	{		
		public function Lock(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function lock():void
		{
			ssCore.Mouse.lock( {}
							  ,{callback:actionComplete, errorSTR:"lockError", code:"29002"} );
		}
	}
}