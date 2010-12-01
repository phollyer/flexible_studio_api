package api.browser.printNoPrompt
{
	import api.browser.Browser;

	import api.events.browser.printNoPrompt.PrintNoPromptEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_printNoPrompt.html Northcode Help Documentation
	*/
	public class PrintNoPrompt extends Browser
	{
		/**
		* Constructor for Browser.PrintNoPrompt()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_printNoPrompt.html Northcode Help Documentation
		*/
		public function PrintNoPrompt(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function print():void
		{
			ssCore.Browser.printNoPrompt( {} , {callback:actionComplete, errorSTR:"printNoPromptError", code:"10019"} );
		}
	}
}