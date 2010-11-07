package api.ado.getFieldList
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getFieldList.GetFieldListEvent;
	
	[Event(name="result", type="api.events.ado.getFieldList.GetFieldListEvent")]
	[Bindable]
	public class GetFieldList extends Ado
	{
		// Result
		public var fieldList:Array = null;
		
		public function GetFieldList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getFieldList():void
		{
			ssCore.Ado.getFieldList( {} , {callback:actionComplete, errorSTR:"getFieldListError", code:"16004"} );
		}
		override protected function sendResult( r:Object ):void
		{
			fieldList = r.result.split( "," );
			
			var e : GetFieldListEvent = new GetFieldListEvent( GetFieldListEvent.RESULT );
			e.fieldList = fieldList;
			dispatchEvent( e );
		}
	}
}