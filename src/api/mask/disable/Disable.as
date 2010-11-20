package api.mask.disable
{
	import flash.events.IEventDispatcher;
	import api.mask.Mask;
	
	[Bindable]
	public class Disable extends Mask
	{
		public function Disable(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function disable():void
		{
			ssCore.Mask.disable( {}
								,{callback:actionComplete, errorSTR:"disableError", code:"27000"} );
		}
	}
}