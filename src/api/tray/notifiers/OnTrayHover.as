package api.tray.notifiers
{
	import api.events.tray.notifiers.OnTrayHoverEvent;

	import api.tray.Tray;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_onTrayHover.html Northcode Help Documentation
	*/
	public class OnTrayHover extends Tray
	{				
		/**
		* Constructor for Tray.OnTrayHover()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_onTrayHover.html Northcode Help Documentation
		*/
		public function OnTrayHover(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tray.setNotify( {event:"onTrayHover"}
							 	  ,{callback:actionComplete, errorSTR:"onTrayHoverError", code:"43008"} );
		}
	}
}