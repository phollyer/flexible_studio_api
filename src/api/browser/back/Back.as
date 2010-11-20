package api.browser.back
{
	import api.browser.Browser;

	import api.events.browser.back.BackEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
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
		*
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