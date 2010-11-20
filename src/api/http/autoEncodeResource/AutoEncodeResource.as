package api.http.autoEncodeResource
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Bindable]
	public class AutoEncodeResource extends Http
	{
		// Optional
		public var flag:Boolean = false;
		
		public function AutoEncodeResource(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function autoEncodeResource():void
		{
			ssCore.Http.autoEncodeResource( {flag:flag}
								 ,{callback:actionComplete, errorSTR:"autoEncodeResourceError", code:"4010"} );
		}
	}
}