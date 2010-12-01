package api.browser.setBrowser
{
	import api.browser.Browser;

	import api.events.browser.setBrowser.SetBrowserEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setBrowser.html Northcode Help Documentation
	*/
	public class SetBrowser extends Browser
	{
		/**
		* 
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
		*
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