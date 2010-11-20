package api.browser.forward
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class Forward extends Browser
	{ 
		public function Forward(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function forward():void
		{
			ssCore.Browser.forward( {} , {callback:actionComplete, errorSTR:"forwardError", code:"10010"} );
		}
	}
}