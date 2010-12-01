package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.OnBlockedURLEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onBlockedURL.html Northcode Help Documentation
	*/
	public class OnBlockedURL extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var url:String = null;
		
		/**
		* Constructor for Browser.OnBlockedURL()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onBlockedURL.html Northcode Help Documentation
		*/
		public function OnBlockedURL(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_BLOCKED_URL} , {callback:actionComplete, errorSTR:"onBlockedURLError", code:"10029"} );
		}
	}
}