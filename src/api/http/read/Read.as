package api.http.read
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Bindable]
	public class Read extends Http
	{
		public function Read(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function read():void
		{
			ssCore.Http.read( {}
							 ,{callback:actionComplete, errorSTR:"readError", code:"4004"} );
		}
	}
}