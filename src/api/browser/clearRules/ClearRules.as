package api.browser.clearRules
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class ClearRules extends Browser
	{
		public function ClearRules(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clearRules():void
		{
			ssCore.Browser.clearRules( {} , {callback:actionComplete, errorSTR:"clearRulesError", code:"10008"} );
		}
	}
}