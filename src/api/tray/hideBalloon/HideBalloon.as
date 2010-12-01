package api.tray.hideBalloon
{
	import api.events.tray.hideBalloon.HideBalloonEvent;

	import api.tray.Tray;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_hideBalloon.html Northcode Help Documentation
	*/
	public class HideBalloon extends Tray
	{
		/**
		* Constructor for Tray.HideBalloon()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_hideBalloon.html Northcode Help Documentation
		*/
		public function HideBalloon(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_hideBalloon.html Northcode Help Documentation
		*/
		public function hideBalloon():void
		{
			ssCore.Tray.hideBalloon( {}
								,{callback:actionComplete, errorSTR:"hideBalloonError", code:"43001"} );
		}
	}
}