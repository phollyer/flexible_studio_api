package api.ado.open
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	[Bindable]
	public class Open extends Ado
	{
		// Result
		public var adoError:String = null;
		
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function open():void
		{
			ssCore.Ado.open( {} , {callback:actionComplete, errorSTR:"openError", code:"16016"} );
		}
	}
}