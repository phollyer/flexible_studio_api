package api.browser.print
{
	import api.browser.Browser;

	import api.events.browser.print.PrintEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* The user will be prompted to select a printer and will be allowed to change the print settings before printing the contents of the loaded page.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_print.html Northcode Help Documentation
	*/
	public class Print extends Browser
	{
		/**
		* Constructor for Browser.Print()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_print.html Northcode Help Documentation
		*/
		public function Print(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* The user will be prompted to select a printer and will be allowed to change the print settings before printing the contents of the loaded page.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_print.html Northcode Help Documentation
		*/
		public function print():void
		{
			ssCore.Browser.print( {} , {callback:actionComplete, errorSTR:"printError", code:"10018"} );
		}
	}
}