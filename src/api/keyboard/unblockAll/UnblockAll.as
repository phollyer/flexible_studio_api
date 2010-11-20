package api.keyboard.ublockAll
{
	import flash.events.IEventDispatcher;
	import api.keyboard.Keyboard;

	[Bindable]
	public class UnblockAll extends Keyboard
	{
		public function UnblockAll(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function unblockAll():void
		{
			ssCore.Keyboard.unblockAll( {}
									   ,{callback:actionComplete, errorSTR:"unblockAllError", code:"25009"} );
		}
	}
}