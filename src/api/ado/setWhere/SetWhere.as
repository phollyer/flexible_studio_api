package api.ado.setWhere
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;

	[Bindable]
	public class SetWhere extends Ado
	{
		// Optional
		public var clause:String = null;
		
		public function SetWhere(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setWhere():void
		{
			switch( clause )
			{
				case "":
				case null:
					ssCore.Ado.setWhere( {}
										,{callback:actionComplete, errorSTR:"setWhereError", code:"16026"} );
					break;
				default:
					ssCore.Ado.setWhere( {clause:clause}
										,{callback:actionComplete, errorSTR:"setWhereError", code:"16026"} );
			}
		}
	}
}