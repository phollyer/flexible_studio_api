package api.browser.setURL
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class SetURL extends Browser
	{
		public var url:String = null;
		
		public function SetURL(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setURL():void
		{
			ssCore.Browser.setURL( {url:url} , {callback:actionComplete, errorSTR:"setURLError", code:"10039"} );
		}
	}
}