package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnDataEvent;
	
	[Event(name="result", type="api.events.app.onData.OnDataEvent")]
	[Bindable]
	public class OnData extends App
	{
		// Results
		public var data:String = null;
		public var dataStream:Array = new Array();
		
		public function OnData(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DATA} , {callback:actionComplete, errorSTR:"onDataError", code:"8025"} );
		}
		override protected function sendResult( r:Object ):void
		{	
			data = r.result;
			dataStream.push( data );
			
			var event : OnDataEvent = new OnDataEvent( OnDataEvent.RESULT );
			events.data = data;
			dispatchEvent( event );
		}
	}
}