package api.ado.getVersion
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getVersion.GetVersionEvent;
	
	[Event(name="result", type="api.events.ado.getVersion.GetVersionEvent")]
	[Bindable]
	public class GetVersion extends Ado
	{
		// Result
		public var version:String = null;
		
		public function GetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getVersion():void
		{
			ssCore.Ado.getVersion( {} , {callback:actionComplete, errorSTR:"getVersionError", code:"16008"} );
		}
		override protected function sendResult( r:Object ):void
		{
			version = r.result;
			
			var e : GetVersionEvent = new GetVersionEvent( GetVersionEvent.RESULT );
			e.version = version;
			dispatchEvent( e );
		}
	}
}