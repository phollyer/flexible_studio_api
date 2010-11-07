package api.browser.addRule
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class AddRule extends Browser
	{
		public static const ALLOW:String = "allow";
		public static const DENY:String = "deny";
		
		public var pattern:String = "*";
		public var type:String = ALLOW;
		
		public function AddRule(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function addRule():void
		{
			ssCore.Browser.addRule( {pattern:pattern , type:type} , {callback:actionComplete, errorSTR:"addRuleError", code:"10000"} );
		}
	}
}