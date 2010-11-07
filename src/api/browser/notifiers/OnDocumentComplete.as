package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.OnDocumentCompleteEvent;

	[Bindable]
	public class OnDocumentComplete extends Browser
	{
		public var url:String = null;
		
		public function OnDocumentComplete(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_DOCUMENT_COMPLETE} , {callback:actionComplete, errorSTR:"onDocumentCompleteError", code:"10030"} );
		}
		}		
	}
}