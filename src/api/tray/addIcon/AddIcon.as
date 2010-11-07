package api.tray.addIcon
{
	import flash.events.IEventDispatcher;
	import api.tray.Tray;
	
	[Bindable]
	public class AddIcon extends Tray
	{
		public function AddIcon(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function addIcon():void
		{
			ssCore.Tray.addIcon( {}
								,{callback:actionComplete, errorSTR:"addIconError", code:"43000"} );
		}
	}
}