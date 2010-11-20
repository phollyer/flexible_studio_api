package api.http.stop
{
	import flash.events.IEventDispatcher;
	import api.http.Http;
	
	[Bindable]
	public class Stop extends Http
	{
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function stop():void
		{			
			ssCore.Http.stop( {}
							 ,{callback:actionComplete, errorSTR:"stopError", code:"4006"} );
		}
	}
}