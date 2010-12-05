package api.browser.back
{
	import api.browser.Browser;

	import api.events.browser.back.BackEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Return to the previous page in the browser history list. This is the same as pressing the back button in Internet Explorer and will trigger an OnNavigate event.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_back.html Northcode Help Documentation
	*/
	public class Back extends Browser
	{
		/**
		* Constructor for Browser.Back()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_back.html Northcode Help Documentation
		*/
		public function Back(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Return to the previous page in the browser history list. This is the same as pressing the back button in Internet Explorer and will trigger an OnNavigate event.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_back.html Northcode Help Documentation
		*/
		public function back():void
		{
			ssCore.Browser.back( {} , {callback:actionComplete, errorSTR:"backError", code:"10004"} );
		}
	}
}