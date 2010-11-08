package api.ado.setSeparator
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;

	[Bindable]
	public class SetSeparator extends Ado
	{
		// Optional
		public var separator:String = "\n";
		
		public function SetSeparator(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setSeparator():void
		{
			ssCore.Ado.setSeparator( {separator:separator}
									,{callback:actionComplete, errorSTR:"setSeparatorError", code:"16023"} );
		}
	}
}