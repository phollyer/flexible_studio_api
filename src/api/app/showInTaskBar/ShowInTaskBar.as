package api.app.showInTaskBar
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;

	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInTaskBar.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInTaskBar.html Northcode Help Documentation
	 */
	public class ShowInTaskBar extends App
	{
		/**
		 * 
		 *
		 * @defaultValue <code>true</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>true</code>
		 */
		public var flag:Boolean = true;
		
		/**
		 * Constructor for App.ShowInTaskBar()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInTaskBar.html Northcode Help Documentation
		 */
		/**
		 * Constructor for App.ShowInTaskBar()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInTaskBar.html Northcode Help Documentation
		 */
		public function ShowInTaskBar(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			flag = true;
			showInTaskBar();
		}
		public function hide():void
		{
			flag = false;
			showInTaskBar();
		}
		private function showInTaskBar():void
		{
			ssCore.App.showInTaskbar( {flag:flag} , {callback:actionComplete, errorSTR:"showInTaskBarError", code:"8021"} );
		}
	}
}