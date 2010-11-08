package api.ado.setSQL
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;

	[Bindable]
	public class SetSQL extends Ado
	{
		// Optional
		public var sql:String = "";
		
		public function SetSQL(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setSQL():void
		{
			ssCore.Ado.setSQL( {sql:sql}
							  ,{callback:actionComplete, errorSTR:"setSQLError", code:"16024"} );
		}
	}
}