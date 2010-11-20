package api.midi.notifiers
{
	import api.events.midi.notifiers.OnRawDataEvent;

	import api.midi.Midi;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.midi.notifiers.OnRawDataEvent.RESULT
	*/
	[Event(name="result", type="api.events.midi.onRawData.OnRawDataEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_onRawData.html Northcode Help Documentation
	*/
	public class OnRawData extends Midi
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var cmd:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var id:String = null;
		public var msec:Number = -1;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var RAW_DATA:Object = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var value1:Object = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var value2:Object = null;
		
		/**
		* Constructor for Midi.OnRawData()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_onRawData.html Northcode Help Documentation
		*/
		public function OnRawData(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Midi.setNotify( {event:"onRawData"}
								  ,{callback:actionComplete, errorSTR:"onRawDataError", code:"28002"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
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