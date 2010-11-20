package api.tcp.close
{
	import flash.events.IEventDispatcher;
	import api.tcp.Tcp;
	
	[Bindable]
	public class Close extends Tcp
	{		
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function close():void
		{
			ssCore.Tcp.close( {}
							 ,{callback:actionComplete, errorSTR:"closeError", code:"40000"} );
		}
	}
}