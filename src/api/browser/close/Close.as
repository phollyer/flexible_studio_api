package api.browser.close
{
	import api.browser.Browser;

	import api.events.browser.close.CloseEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_close.html Northcode Help Documentation
	*/
	public class Close extends Browser
	{
		/**
		* Constructor for Browser.Close()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_close.html Northcode Help Documentation
		*/
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_close.html Northcode Help Documentation
		*/
		public function closeBrowser():void
		{
			ssCore.Browser.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"10009"} );
		}
	}
}