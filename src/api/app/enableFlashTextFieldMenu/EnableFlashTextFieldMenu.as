package api.app.enableFlashTextFieldMenu
{
	import flash.events.IEventDispatcher;
	
	
	import api.app.App;

	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_enableFlashTextFieldMenu.html Northcode Help Documentation
	 */
	public class EnableFlashTextFieldMenu extends App
	{
		// Optional
		/**
		 * 
		 *
		 * @defaultValue <code>true</code>
		 */
		public var flag:Boolean = true;
		
		/**
		 * Constructor for App.EnableFlashTextFieldMenu()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_enableFlashTextFieldMenu.html Northcode Help Documentation
		 */
		public function EnableFlashTextFieldMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function disable():void
		{
			flag = false;
			setMenu();
		}
		public function enable():void
		{
			flag = true;
			setMenu();
		}
		private function setMenu():void
		{
			ssCore.App.enableFlashTextFieldMenu( {flag:flag} , {callback:actionComplete, errorSTR:"enableFlashTextFieldMenuError", code:"8009"} );
		}
	}
}