package api.midi.getInfo
{
	import api.events.midi.getInfo.GetInfoEvent;

	import api.midi.Midi;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.midi.getInfo.GetInfoEvent.RESULT
	*/
	[Event(name="result", type="api.events.midi.getInfo.GetInfoEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_getInfo.html Northcode Help Documentation
	*/
	public class GetInfo extends Midi
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var deviceData:XML = null;
		
		/**
		* Constructor for Midi.GetInfo()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_getInfo.html Northcode Help Documentation
		*/
		public function GetInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_getInfo.html Northcode Help Documentation
		*/
		public function getInfo():void
		{
			ssCore.Midi.getInfo( {}
								,{callback:actionComplete, errorSTR:"getInfoError", code:"28000"} );
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
			deviceData = XML( r.result );
			
			var e : GetInfoEvent = new GetInfoEvent( GetInfoEvent.RESULT );
			e.deviceData = deviceData;
			dispatchEvent( e );
		}
	}
}