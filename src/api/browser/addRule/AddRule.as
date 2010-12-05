package api.browser.addRule
{
	import api.browser.Browser;

	import api.events.browser.addRule.AddRuleEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Add a rule that allows or denies URLs in the embedded browser.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_addRule.html Northcode Help Documentation
	*/
	public class AddRule extends Browser
	{
		public static const ALLOW:String = "allow";
		public static const DENY:String = "deny";
		
		public var pattern:String = "*";
		/**
		* The rule type that determines whether URLs matching the pattern argument will be allowed. Valid values include: allow and deny.
		*
		* @defaultValue <code>ALLOW</code>
		*/
		public var type:String = ALLOW;
		
		/**
		* Constructor for Browser.AddRule()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_addRule.html Northcode Help Documentation
		*/
		public function AddRule(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		* Add a rule that allows or denies URLs in the embedded browser.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_addRule.html Northcode Help Documentation
		*/
		public function addRule():void
		{
			ssCore.Browser.addRule( {pattern:pattern , type:type} , {callback:actionComplete, errorSTR:"addRuleError", code:"10000"} );
		}
	}
}