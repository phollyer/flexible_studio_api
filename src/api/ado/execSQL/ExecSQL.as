package api.ado.execSQL
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	[Event(name="missingSql" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ExecSQL extends Ado
	{
		// Required
		public var sql:String = null;
		
		// Result
		public var adoError:String = null;
		
		public function ExecSQL(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function execSQL( sqlQuery:String = null ):void
		{
			sql = compareStrings( sqlQuery , sql );
			switch( sql )
			{
				case null:
					missingSQL();
					break;
				default:
					ssCore.Ado.execSQL( {sql:sql} , {callback:actionComplete, errorSTR:"execSQLError", code:"16001"} );
			}
		}
	}
}