package api.app.updateGlobals
{
	import api.app.App;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_updateGlobals.html Northcode Help Documentation
	 */
	public class UpdateGlobals extends App
	{
		/**
		 * Constructor for App.UpdateGlobals()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_updateGlobals.html Northcode Help Documentation
		 */
		public function UpdateGlobals(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_updateGlobals.html Northcode Help Documentation
		 */
		public function updateGlobals():void
		{
			ssCore.App.updateGlobals( {} , {callback:actionComplete, errorSTR:"updateGlobalsError", code:"8023"} );
		}
	}
}