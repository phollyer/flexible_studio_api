package api.tray.removeIcon
{
	import api.events.tray.removeIcon.RemoveIconEvent;

	import api.tray.Tray;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Remove the application icon from the system tray at runtime.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_removeIcon.html Northcode Help Documentation
	*/
	public class RemoveIcon extends Tray
	{
		/**
		* Constructor for Tray.RemoveIcon()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_removeIcon.html Northcode Help Documentation
		*/
		public function RemoveIcon(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Remove the application icon from the system tray at runtime.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_removeIcon.html Northcode Help Documentation
		*/
		public function removeIcon():void
		{
			ssCore.Tray.removeIcon( {}
								,{callback:actionComplete, errorSTR:"removeIconError", code:"43002"} );
		}
	}
}