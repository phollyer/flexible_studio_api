package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.OnPreviewEvent;

	[Bindable]
	public class OnPreview extends Browser
	{
		public var url:String = null;
		
		public function OnPreview(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_PREVIEW} , {callback:actionComplete, errorSTR:"onPreviewError", code:"10032"} );
		}
		}		
	}
}