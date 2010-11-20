package api.midi.stop
{
	import api.events.midi.stop.StopEvent;

	import api.midi.Midi;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_stop.html Northcode Help Documentation
	*/
	public class Stop extends Midi
	{
		/**
		* Constructor for Midi.Stop()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_stop.html Northcode Help Documentation
		*/
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_MIDI_stop.html Northcode Help Documentation
		*/
		public function stop():void
		{
			ssCore.Midi.stop( {}
							 ,{callback:actionComplete, errorSTR:"stopError", code:"28004"} );
		}
	}
}