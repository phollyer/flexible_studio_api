package api.ado.close
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	[Bindable]
	public class Close extends Ado
	{
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function close():void
		{
			ssCore.Ado.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"16000"} );
		}
	}
}