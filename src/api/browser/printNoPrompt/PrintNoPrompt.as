package api.browser.printNoPrompt
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class PrintNoPrompt extends Browser
	{
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