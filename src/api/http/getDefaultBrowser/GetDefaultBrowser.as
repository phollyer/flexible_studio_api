package api.http.getDefaultBrowser
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.http.getDefaultBrowser.GetDefaultBrowserEvent;
	import api.http.Http;

	[Event(name="result", type="api.events.http.getDefaultBrowser.GetDefaultBrowserEvent")]
	[Bindable]
	public class GetDefaultBrowser extends Http
	{
		// Result
		public var browser:String = null;
		
		public function GetDefaultBrowser(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getDefaultBrowser():void
		{
			ssCore.Http.getDefaultBrowser( {}
								 		  ,{callback:actionComplete, errorSTR:"getDefaultBrowserError", code:"4012"} );
		}
		override protected function sendResult( r:Object ):void
		{
			browser = r.result;
			
			var e : GetDefaultBrowserEvent = new GetDefaultBrowserEvent( GetDefaultBrowserEvent.RESULT );
			e.browser = browser;
			dispatchEvent( e );
		}
	}
}