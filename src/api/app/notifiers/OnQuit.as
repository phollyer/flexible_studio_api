package api.app.notifiers
{
	import api.app.App;

	import api.events.app.notifiers.OnQuitEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onQuit.html Northcode Help Documentation
	*/
	public class OnQuit extends App
	{
		/**
		* Constructor for App.OnQuit()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onQuit.html Northcode Help Documentation
		*/
		public function OnQuit(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_QUIT} , {callback:actionComplete, errorSTR:"onQuitError", code:"8003"} );
		}
	}
}