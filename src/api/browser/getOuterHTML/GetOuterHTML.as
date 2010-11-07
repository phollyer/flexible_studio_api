package api.browser.getOuterHTML
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.getOuterHTML.GetOuterHTMLEvent;
	
	[Event(name="result", type="api.events.browser.getOuterHTML.GetOuterHTMLEvent")]
	[Bindable]
	public class GetOuterHTML extends Browser
	{
		public var html:String = null;
		
		public function GetOuterHTML(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getOuterHTML():void
		{
			ssCore.Browser.getOuterHTML( {} , {callback:actionComplete, errorSTR:"getOuterHTMLError", code:"10013"} );
		}
		override protected function sendResult( r:Object ):void
		{
			html = result;
			var e : GetOuterHTMLEvent = new GetOuterHTMLEvent( GetOuterHTMLEvent.RESULT );
			e.outerHTML = html;
			dispatchEvent( e );
		}
	}
}