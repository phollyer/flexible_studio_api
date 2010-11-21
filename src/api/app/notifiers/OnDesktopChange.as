package api.app.notifiers
{
	import api.app.App;

	import api.events.app.notifiers.OnDesktopChangeEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onDesktopChange.html Northcode Help Documentation
	*/
	public class OnDesktopChange extends App
	{
		/**
		* Constructor for App.OnDesktopChange()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onDesktopChange.html Northcode Help Documentation
		*/
		public function OnDesktopChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DESKTOP_CHANGE} , {callback:actionComplete, errorSTR:"onDesktopChangeError", code:"8026"} );
		}
		
	}
}