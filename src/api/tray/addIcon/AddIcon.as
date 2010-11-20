package api.tray.addIcon
{
	import api.events.tray.addIcon.AddIconEvent;

	import api.tray.Tray;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_addIcon.html Northcode Help Documentation
	*/
	public class AddIcon extends Tray
	{
		/**
		* Constructor for Tray.AddIcon()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_addIcon.html Northcode Help Documentation
		*/
		public function AddIcon(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_addIcon.html Northcode Help Documentation
		*/
		public function addIcon():void
		{
			ssCore.Tray.addIcon( {}
								,{callback:actionComplete, errorSTR:"addIconError", code:"43000"} );
		}
	}
}