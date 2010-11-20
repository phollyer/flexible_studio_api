package api.http.start
{
	import flash.events.IEventDispatcher;
	import api.http.Http;
	
	[Bindable]
	public class Start extends Http
	{
		public function Start(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function start():void
		{
			ssCore.Http.start( {}
							  ,{callback:actionComplete, errorSTR:"startError", code:"4001"} );
		}
	}
}