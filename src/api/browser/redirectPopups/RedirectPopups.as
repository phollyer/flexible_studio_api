package api.browser.redirectPopups
{
	import api.browser.Browser;

	import api.events.browser.redirectPopups.RedirectPopupsEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_redirectPopups.html Northcode Help Documentation
	*/
	public class RedirectPopups extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var flag:Boolean = false;
		
		/**
		* Constructor for Browser.RedirectPopups()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_redirectPopups.html Northcode Help Documentation
		*/
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