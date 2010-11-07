package api.ado.refresh
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;

	[Bindable]
	public class Refresh extends Ado
	{
		public function Refresh(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function refresh():void
		{
			ssCore.Ado.refresh( {} , {callback:actionComplete, errorSTR:"refreshError", code:"16017"} );
		}
	}
}