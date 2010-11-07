package api.midi.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.midi.notifiers.OnRawDataEvent;
	import api.midi.Midi;
	
	[Event(name="result", type="api.events.midi.onRawData.OnRawDataEvent")]
	[Bindable]
	public class OnRawData extends Midi
	{
		// Results
		public var cmd:String = null;
		public var id:String = null;
		public var msec:Number = -1;
		public var RAW_DATA:Object = null;
		public var value1:Object = null;
		public var value2:Object = null;
		
		public function OnRawData(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Midi.setNotify( {event:"onRawData"}
								  ,{callback:actionComplete, errorSTR:"onRawDataError", code:"28002"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __r:Array = r.result.split( COMMA );
			RAW_DATA = __r[ 0 ];
			id = String( __r[ 1 ] );
			msec = Number( __r[ 2 ] );
			cmd = String( __r[ 3 ] );
			value1 = __r[ 4 ];
			value2 = __r[ 5 ];
			
			var e : OnRawDataEvent = new OnRawDataEvent( OnRawDataEvent.RESULT );
			e.cmd = cmd;
			e.id = id;
			e.msec = msec;
			e.RAW_DATA = RAW_DATA;
			e.value1 = value1;
			e.value2 = value2;
			dispatchEvent( e );
		}
	}
}