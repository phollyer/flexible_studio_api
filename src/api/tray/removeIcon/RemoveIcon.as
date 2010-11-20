package api.tray.removeIcon
{
	import flash.events.IEventDispatcher;
	import api.tray.Tray;
	
	[Bindable]
	public class RemoveIcon extends Tray
	{
		public function RemoveIcon(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function removeIcon():void
		{
			ssCore.Tray.removeIcon( {}
								,{callback:actionComplete, errorSTR:"removeIconError", code:"43002"} );
		}
	}
}