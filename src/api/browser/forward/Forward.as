package api.browser.forward
{
	import api.browser.Browser;

	import api.events.browser.forward.ForwardEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
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
		*
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