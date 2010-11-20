package api.browser.setBrowser
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class SetBrowser extends Browser
	{
		public var browser:String = IE;
		
		public function SetBrowser(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setBrowser():void
		{
			ssCore.Browser.setBrowser( {browser:browser} , {callback:actionComplete, errorSTR:"setBrowserError", code:"10025"} );
		}
	}
}