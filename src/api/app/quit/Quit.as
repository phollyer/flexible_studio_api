package api.app.quit
{
	import api.app.App;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 *
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
		 *
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