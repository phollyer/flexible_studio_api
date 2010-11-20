package api.clipboard.getData
{
	import flash.events.IEventDispatcher;
	
	import api.clipboard.Clipboard;
	
	import api.events.clipboard.getData.GetDataEvent;
	
	[Event(name="result", type="api.events.clipboard.getData.GetDataEvent")]
	[Bindable]
	public class GetData extends Clipboard
	{
		// Optional
		public var asText:Boolean = false;
		
		// Results
		public var data:Object = null;
		public var dataType:Object = null;
		
		public function GetData(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getData():void
		{
			ssCore.Clipboard.getData( {asText:asText} , {callback:actionComplete, errorSTR:"getDataError", code:"12002"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			dataType = r.type;
			
			var e : GetDataEvent = new GetDataEvent( GetDataEvent.RESULT );
			e.data = data;
			e.dataType = dataType;
			dispatchEvent( e );
		}
	}
}