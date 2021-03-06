package api.app.enableFlashMenu
{
	import api.app.App;

	import api.events.app.enableFlashMenu.EnableFlashMenuEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_enableFlashMenu.html Northcode Help Documentation
	 */
	public class EnableFlashMenu extends App
	{
		// Optional
		/**
		 * 
		 *
		 * @defaultValue <code>true</code>
		 */
		public var flag:Boolean = true;
		
		/**
		 * Constructor for App.EnableFlashMenu()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_enableFlashMenu.html Northcode Help Documentation
		 */
		public function EnableFlashMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function enable():void
		{
			flag = true;
			setMenu();
		}
		public function disable():void
		{
			flag = false;
			setMenu();
		}
		private function setMenu():void
		{
			ssCore.App.enableFlashMenu( {flag:flag} , {callback:actionComplete, errorSTR:"enableFlashMenuError", code:"8008"} );
		}
	}
}