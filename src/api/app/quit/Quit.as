package api.app.quit
{
	import api.app.App;

	import api.events.app.quit.QuitEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 * Performs the same job as calling the Flash Quit FSCommand, asks SWF Studio to shut down your application.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_quit.html Northcode Help Documentation
	 */
	public class Quit extends App
	{
		/**
		 * Constructor for App.Quit()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_quit.html Northcode Help Documentation
		 */
		public function Quit(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Performs the same job as calling the Flash Quit FSCommand, asks SWF Studio to shut down your application.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_quit.html Northcode Help Documentation
		 */
		public function quit():void
		{
			ssCore.App.quit( {} , {callback:actionComplete, errorSTR:"quitError", code:"8013"} );
		}
	}
}