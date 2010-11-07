package api.browser.allowMenu
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class AllowMenu extends Browser
	{
		public var _allow:Boolean = true;
		
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