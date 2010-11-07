package api.browser.getHREF
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.getHREF.GetHREFEvent;
	
	[Event(name="result", type="api.events.browser.getHREF.GetHREFEvent")]
	[Bindable]
	public class GetHREF extends Browser
	{
		public var href:String = null;
		
		public function GetHREF(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getHREF():void
		{
			ssCore.Browser.getHREF( {} , {callback:actionComplete, errorSTR:"getHREFError", code:"10012"} );
		}
		override protected function sendResult( r:Object ):void
		{
			href = result;
			var e : GetHREFEvent = new GetHREFEvent( GetHREFEvent.RESULT );
			e.href = href;
			dispatchEvent( e );
		}
	}
}