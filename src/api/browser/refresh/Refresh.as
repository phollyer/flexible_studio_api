package api.browser.refresh
{
	import api.browser.Browser;

	import api.events.browser.refresh.RefreshEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Refresh the contents of the current page.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_refresh.html Northcode Help Documentation
	*/
	public class Refresh extends Browser
	{
		/**
		* Constructor for Browser.Refresh()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_refresh.html Northcode Help Documentation
		*/
		public function Refresh(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Refresh the contents of the current page.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_refresh.html Northcode Help Documentation
		*/
		public function refresh():void
		{
			ssCore.Browser.refresh( {} , {callback:actionComplete, errorSTR:"refreshError", code:"10021"} );
		}
	}
}