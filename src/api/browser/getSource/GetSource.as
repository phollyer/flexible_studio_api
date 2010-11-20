package api.browser.getSource
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.getSource.GetSourceEvent;
	
	[Event(name="result", type="api.events.browser.getSource.GetSourceEvent")]
	[Bindable]
	public class GetSource extends Browser
	{
		public var source:String = null;
		
		public function GetSource(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getSource():void
		{
			ssCore.Browser.getSource( {} , {callback:actionComplete, errorSTR:"getSourceError", code:"10014"} );
		}
		override protected function sendResult( r:Object ):void
		{
			source = result;
			var e : GetSourceEvent = new GetSourceEvent( GetSourceEvent.RESULT );
			e.source = source;
			dispatchEvent( e );
		}
	}
}