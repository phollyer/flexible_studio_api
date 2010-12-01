package api.browser.open
{
	import api.browser.Browser;

	import api.events.browser.open.OpenEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_open.html Northcode Help Documentation
	*/
	public class Open extends Browser
	{
		/**
		* Constructor for Browser.Open()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_open.html Northcode Help Documentation
		*/
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_open.html Northcode Help Documentation
		*/
		public function open():void
		{
			ssCore.Browser.open( {} , {callback:actionComplete, errorSTR:"openError", code:"10017"} );
		}
	}
}