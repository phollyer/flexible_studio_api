package api.app.setKioskMode
{
	import flash.events.IEventDispatcher;
	
	
	import api.app.App;

	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setKioskMode.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setKioskMode.html Northcode Help Documentation
	 */
	public class SetKioskMode extends App
	{
		/**
		 * 
		 *
		 * @defaultValue <code>false</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>false</code>
		 */
		public var flag:Boolean = false;
		
		/**
		 * Constructor for App.SetKioskMode()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setKioskMode.html Northcode Help Documentation
		 */
		/**
		 * Constructor for App.SetKioskMode()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setKioskMode.html Northcode Help Documentation
		 */
		public function SetKioskMode(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function enableKioskMode():void
		{
			flag = true;
			setKioskMode();
		}
		public function disableKioskMode():void
		{
			flag = false;
			setKioskMode();
		}
		private function setKioskMode():void
		{
			ssCore.App.setKioskMode( {flag:flag} , {callback:actionComplete, errorSTR:"setKioskModeError", code:"8016"} );
		}
	}
}