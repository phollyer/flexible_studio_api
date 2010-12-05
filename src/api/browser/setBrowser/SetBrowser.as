package api.browser.setBrowser
{
	import api.browser.Browser;

	import api.events.browser.setBrowser.SetBrowserEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Called before the Open method to tell SWF Studio which browser to use
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setBrowser.html Northcode Help Documentation
	*/
	public class SetBrowser extends Browser
	{
		/**
		* Name of the browser to embedd Valid values include: IE and MOZILLA.
		*
		* @defaultValue <code>IE</code>
		*/
		public var browser:String = IE;
		
		/**
		* Constructor for Browser.SetBrowser()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setBrowser.html Northcode Help Documentation
		*/
		public function SetBrowser(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Called before the Open method to tell SWF Studio which browser to use
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setBrowser.html Northcode Help Documentation
		*/
		public function setBrowser():void
		{
			ssCore.Browser.setBrowser( {browser:browser} , {callback:actionComplete, errorSTR:"setBrowserError", code:"10025"} );
		}
	}
}