package api.ado.getProvider
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getProvider.GetProviderEvent;
	
	[Event(name="result", type="api.events.ado.getProvider.GetProviderEvent")]
	[Bindable]
	public class GetProvider extends Ado
	{
		// Result
		public var provider:String = null;
		
		public function GetProvider(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getProvider():void
		{
			ssCore.Ado.getProvider( {} , {callback:actionComplete, errorSTR:"getProviderError", code:"16005"} );
		}
		override protected function sendResult( r:Object ):void
		{
			provider = r.result;
			
			var e : GetProviderEvent = new GetProviderEvent( GetProviderEvent.RESULT );
			e.provider = provider;
			dispatchEvent( e );
		}
	}
}