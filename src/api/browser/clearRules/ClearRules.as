package api.browser.clearRules
{
	import api.browser.Browser;

	import api.events.browser.clearRules.ClearRulesEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Removes all existing rules, allowing the embedded browser to navigate to any domain without restriction.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_clearRules.html Northcode Help Documentation
	*/
	public class ClearRules extends Browser
	{
		/**
		* Constructor for Browser.ClearRules()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_clearRules.html Northcode Help Documentation
		*/
		public function ClearRules(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Removes all existing rules, allowing the embedded browser to navigate to any domain without restriction.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_clearRules.html Northcode Help Documentation
		*/
		public function clearRules():void
		{
			ssCore.Browser.clearRules( {} , {callback:actionComplete, errorSTR:"clearRulesError", code:"10008"} );
		}
	}
}