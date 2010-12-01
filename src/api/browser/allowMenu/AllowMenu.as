package api.browser.allowMenu
{
	import api.browser.Browser;

	import api.events.browser.allowMenu.AllowMenuEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_allowMenu.html Northcode Help Documentation
	*/
	public class AllowMenu extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var _allow:Boolean = true;
		
		/**
		* Constructor for Browser.AllowMenu()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_allowMenu.html Northcode Help Documentation
		*/
		public function AllowMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function allow():void
		{
			_allow = true;
			setMenu()	
		}
		public function deny():void
		{
			_allow = false;
			setMenu();
		}
		private function setMenu():void
		{
			ssCore.Browser.allowMenu( {flag:_allow} , {callback:actionComplete, errorSTR:"allowMenuError", code:"10002"} );
		}
	}
}