package api.tray.hideBalloon
{
	import flash.events.IEventDispatcher;
	import api.tray.Tray;
	
	[Bindable]
	public class HideBalloon extends Tray
	{
		public function HideBalloon(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function hideBalloon():void
		{
			ssCore.Tray.hideBalloon( {}
								,{callback:actionComplete, errorSTR:"hideBalloonError", code:"43001"} );
		}
	}
}