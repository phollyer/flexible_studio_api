package api.app.updateTransparency
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_updateTransparency.html Northcode Help Documentation
	 */
	public class UpdateTransparency extends App
	{
		/**
		 * Constructor for App.UpdateTransparency()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_updateTransparency.html Northcode Help Documentation
		 */
		public function UpdateTransparency(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_updateTransparency.html Northcode Help Documentation
		 */
		public function updateTransparency():void
		{
			ssCore.App.updateTransparency( {} , {callback:actionComplete, errorSTR:"updateTransparencyError", code:"8024"} );
		}
	}
}