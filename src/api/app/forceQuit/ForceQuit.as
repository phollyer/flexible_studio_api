package api.app.forceQuit
{
	import api.app.App;

	import api.events.app.forceQuit.ForceQuitEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_forceQuit.html Northcode Help Documentation
	 */
	public class ForceQuit extends App
	{
		/**
		 * Constructor for App.ForceQuit()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_forceQuit.html Northcode Help Documentation
		 */
		public function ForceQuit(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_forceQuit.html Northcode Help Documentation
		 */
		public function forceQuit():void
		{
			ssCore.App.forceQuit( {} , {callback:actionComplete, errorSTR:"forceQuitError", code:"8011"} );
		}
	}
}