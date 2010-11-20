package api.udp.close
{
	import flash.events.IEventDispatcher;
	import api.udp.Udp;
	
	[Bindable]
	public class Close extends Udp
	{		
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function close():void
		{
			ssCore.Udp.close( {}
							 ,{callback:actionComplete, errorSTR:"closeError", code:"44001"} );
		}
	}
}