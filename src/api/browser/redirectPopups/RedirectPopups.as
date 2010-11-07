package api.browser.redirectPopups
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class RedirectPopups extends Browser
	{
		public var flag:Boolean = false;
		
		public function RedirectPopups(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setInBrowser():void
		{
			flag = true;
			setRedirect();
		}
		public function setInNewWindow():void
		{
			flag = false;
			setRedirect();
		}
		private function setRedirect():void
		{
			ssCore.Brower.redirectPopUps( {flag:flag} , {callback:actionComplete, errorSTR:"redirectPopupsError", code:"10020"} );
		}
	}
}