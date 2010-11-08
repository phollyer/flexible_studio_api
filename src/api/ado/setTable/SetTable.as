package api.ado.setTable
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;

	[Bindable]
	public class SetTable extends Ado
	{
		// Optional
		public var name:String = null;
		
		public function SetTable(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setTable( tableName:String = null ):void
		{
			name = compareStrings( tableName , name );
			switch( name )
			{
				case "":
				case null:
					ssCore.Ado.setTable( {}
										,{callback:actionComplete, errorSTR:"setTableError", code:"16025"} );
					break;
				default:
					ssCore.Ado.setTable( {name:name}
										,{callback:actionComplete, errorSTR:"setTableError", code:"16025"} );
			}
		}
	}
}