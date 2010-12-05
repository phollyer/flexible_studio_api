package api.browser.forward
{
	import api.browser.Browser;

	import api.events.browser.forward.ForwardEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Move to the next  page in the browser history list. This is the same as pressing the Forward button in Internet Explorer and will trigger an OnNavigate event.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_forward.html Northcode Help Documentation
	*/
	public class Forward extends Browser
	{ 
		/**
		* Constructor for Browser.Forward()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_forward.html Northcode Help Documentation
		*/
		public function Forward(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Move to the next  page in the browser history list. This is the same as pressing the Forward button in Internet Explorer and will trigger an OnNavigate event.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_forward.html Northcode Help Documentation
		*/
		public function forward():void
		{
			ssCore.Browser.forward( {} , {callback:actionComplete, errorSTR:"forwardError", code:"10010"} );
		}
	}
}