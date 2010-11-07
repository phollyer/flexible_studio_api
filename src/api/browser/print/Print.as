package api.browser.print
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class Print extends Browser
	{
		public function Print(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function print():void
		{
			ssCore.Browser.print( {} , {callback:actionComplete, errorSTR:"printError", code:"10018"} );
		}
	}
}